# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-libs/ccmath/Attic/ccmath-2.2.1.ebuild,v 1.12 2010/07/07 07:42:12 jlec dead $

inherit eutils

DESCRIPTION="a math library that contains functions for a wide variety of computations"
HOMEPAGE="http://freshmeat.net/projects/ccmath/"
SRC_URI="http://www.ibiblio.org/pub/Linux/libs/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~x86 ~ppc ~sparc ~amd64"
IUSE=""

DEPEND=""

src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}"/${P}-fPIC.patch
}

src_compile() {
	# if it is amd64 we doesn't support intels
	use amd64 && yes n | ./makelibs.sh || yes | ./makelibs.sh
}

src_install() {
	dolib.so tmp/libccm.so || die
	dolib.a tmp/libccm.a || die
	insinto /usr/include
	doins ccmath.h || die
	dodoc CHANGES INSTALL README manual/*
}
