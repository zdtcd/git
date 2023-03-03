#!/usr/bin/env bash
#
# Install dependencies required to build and test Git on Linux and macOS
#

. ${0%/*}/lib.sh

P4WHENCE=https://cdist2.perforce.com/perforce/r21.2
LFSWHENCE=https://github.com/github/git-lfs/releases/download
UBUNTU_COMMON_PKGS="make libssl-dev libcurl4-openssl-dev libexpat-dev
 tcl tk gettext zlib1g-dev perl-modules liberror-perl libauthen-sasl-perl
 libemail-valid-perl libio-socket-ssl-perl libnet-smtp-ssl-perl"

_install_linux_p4() {
	mkdir --parents "$P4_PATH"
	pushd "$P4_PATH"
		wget --quiet "$P4WHENCE/bin.linux26x86_64/p4d"
		wget --quiet "$P4WHENCE/bin.linux26x86_64/p4"
		chmod u+x p4d
		chmod u+x p4
	popd
}

_install_linux_git_lfs() {
	local whence fname
	whence="$1"
	fname="$2"
	mkdir --parents "$GIT_LFS_PATH"
	pushd "$GIT_LFS_PATH"
		wget --quiet "$whence/$fname"
		tar --extract --gunzip --strip-components=1 --file "$fname"
	popd
}

case "$runs_on_pool" in
ubuntu-*)
	sudo apt-get -q update
	sudo apt-get -q -y install language-pack-is libsvn-perl apache2 \
		$UBUNTU_COMMON_PKGS $CC_PACKAGE $PYTHON_PACKAGE

	case "$(uname -m)" in
	x86_64)
		_install_linux_p4
		_install_linux_git_lfs "$LFSWHENCE/v${LINUX_GIT_LFS_VERSION}" \
			"git-lfs-linux-amd64-$LINUX_GIT_LFS_VERSION.tar.gz"
		;;
	*)
		echo "Not supported architecture" >&2
		exit 1
		;;
	esac
	;;
macos-*)
	export HOMEBREW_NO_AUTO_UPDATE=1 HOMEBREW_NO_INSTALL_CLEANUP=1
	# Uncomment this if you want to run perf tests:
	# brew install gnu-time
	test -z "$BREW_INSTALL_PACKAGES" ||
	brew install $BREW_INSTALL_PACKAGES
	brew link --force gettext
	mkdir -p $HOME/bin
	(
		cd $HOME/bin
		wget -q "$P4WHENCE/bin.macosx1015x86_64/helix-core-server.tgz" &&
		tar -xf helix-core-server.tgz &&
		sudo xattr -d com.apple.quarantine p4 p4d 2>/dev/null || true
	)
	PATH="$PATH:${HOME}/bin"
	export PATH

	if test -n "$CC_PACKAGE"
	then
		BREW_PACKAGE=${CC_PACKAGE/-/@}
		brew install "$BREW_PACKAGE"
		brew link "$BREW_PACKAGE"
	fi
	;;
esac

case "$jobname" in
StaticAnalysis)
	sudo apt-get -q update
	sudo apt-get -q -y install coccinelle libcurl4-openssl-dev libssl-dev \
		libexpat-dev gettext make
	;;
sparse)
	sudo apt-get -q update -q
	sudo apt-get -q -y install libssl-dev libcurl4-openssl-dev \
		libexpat-dev gettext zlib1g-dev
	;;
Documentation)
	sudo apt-get -q update
	sudo apt-get -q -y install asciidoc xmlto docbook-xsl-ns make

	test -n "$ALREADY_HAVE_ASCIIDOCTOR" ||
	sudo gem install --version 1.5.8 asciidoctor
	;;
linux-gcc-default)
	sudo apt-get -q update
	sudo apt-get -q -y install $UBUNTU_COMMON_PKGS
	;;
esac

if type p4d >/dev/null 2>&1 && type p4 >/dev/null 2>&1
then
	echo "$(tput setaf 6)Perforce Server Version$(tput sgr0)"
	p4d -V
	echo "$(tput setaf 6)Perforce Client Version$(tput sgr0)"
	p4 -V
else
	echo >&2 "WARNING: perforce wasn't installed, see above for clues why"
fi
if type git-lfs >/dev/null 2>&1
then
	echo "$(tput setaf 6)Git-LFS Version$(tput sgr0)"
	git-lfs version
else
	echo >&2 "WARNING: git-lfs wasn't installed, see above for clues why"
fi
