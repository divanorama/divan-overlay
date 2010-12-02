# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="Linux Interactive DisAssembler. A disassembler and code analysis \ 
			tool."
HOMEPAGE="http://lida.reverse-engineering.net"
SRC_URI="mirror://sourceforge/lida/${P}.tgz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

RDEPEND="dev-perl/perl-tk
		>=sys-libs/libdisasm-0.16"

S=${WORKDIR}/${P}

src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}/${P}-fix.patch"
}

src_compile() {
	cd ${WORKDIR}/${P}
	emake || die "emake failed"
}

src_install() {
	cd ${WORKDIR}/${P}
	exeinto /opt/lida
	doexe lida lida_back lida.pl 

	dodoc README NOTES CHANGELOG TODO
}
