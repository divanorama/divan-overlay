# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-libs/libgit2/libgit2-0.17.0.ebuild,v 1.2 2012/05/23 00:43:14 radhermit Exp $

EAPI=4

inherit cmake-utils multilib git-2

DESCRIPTION="A linkable library for Git"
HOMEPAGE="http://libgit2.github.com/"
SRC_URI=""
EGIT_REPO_URI="git://github.com/libgit2/${PN}.git"
EGIT_BRANCH="development"

LICENSE="GPL-2-with-linking-exception"
SLOT="0"
KEYWORDS=""
IUSE="examples test"

RDEPEND="sys-libs/zlib"
DEPEND="${RDEPEND}"

DOCS=( README.md )

src_unpack() {
	git-2_src_unpack
}

src_configure() {
	local mycmakeargs=(
		-DINSTALL_LIB="${EPREFIX}/usr/$(get_libdir)"
		$(cmake-utils_use_build test CLAR)
	)
	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install

	if use examples ; then
		find examples -name .gitignore -delete
		dodoc -r examples
		docompress -x /usr/share/doc/${PF}/examples
	fi
}
