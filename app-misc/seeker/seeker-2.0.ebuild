# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils toolchain-funcs

EAPI=3

DESCRIPTION="Read small pieces of data from a raw disk device, in a random
access pattern."
HOMEPAGE="http://www.linuxinsight.com/how_fast_is_your_disk.html"
SRC_URI="http://www.linuxinsight.com/files/seeker.c"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_unpack() {
	mkdir -p "${S}"/ || die
	cp "${DISTDIR}"/${A} "${S}"/ || die
}

src_prepare() {
	epatch "${FILESDIR}"/${A}.patch || die
}

src_compile() {
	cd ${S} && $(tc-getCXX) -O2 seeker.c -o seeker || die
}

src_install() {
	dobin seeker || die
}
