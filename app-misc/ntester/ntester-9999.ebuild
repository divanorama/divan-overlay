# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit git mono

DESCRIPTION="!test.exe clone"
HOMEPAGE=""
EGIT_REPO_URI="git://github.com/divanorama/ntester.git"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-lang/nemerle
	dev-libs/reuse"
RDEPEND=""

src_compile() {
	emake || die
}

src_install() {
	dobin ntester.exe || die
	dobin ${FILESDIR}/ntester || die
}
