# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit versionator 

MY_PV=$(replace_version_separator '_' '-')
DESCRIPTION="libdisasm provides basic disassembly of x86 instructions."
HOMEPAGE="http://bastard.sourceforge.net/libdisasm.html"
SRC_URI="mirror://sourceforge/bastard/${PN}_${MY_PV}.tgz"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="~x86"
IUSE="doc"

src_compile() {
	cd ${WORKDIR}/${PN}_${MY_PV}
	emake || die "emake failed"
}

src_install() {
	dolib ${WORKDIR}/${PN}_${MY_PV}/${PN}/libdisasm.so

	if use doc ; then
		cd ${WORKDIR}/${PN}_${MY_PV}/doc
		dodoc libdisasm.txt
		cd ${WORKDIR}/${PN}_${MY_PV}/man
		doman libdisasm.7 x86_disasm.3 x86_format_insn.3 x86_init.3 x86dis.1 
	fi
}
