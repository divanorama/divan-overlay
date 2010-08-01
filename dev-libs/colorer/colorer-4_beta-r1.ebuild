# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit versionator

MY_PV=( $(get_all_version_components "${PV}" ) )

DESCRIPTION="Colorer library provides source text syntax highlighting services."
HOMEPAGE="http://colorer.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/Colorer-take5-linux.${MY_PV[2]}${MY_PV[0]}.tar.bz2"

LICENSE="MPL-1.1 || ( GPL-2 LGPL-2.1 )"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

S=$WORKDIR

src_compile() {
	econf
	emake || die "emake failed"
}

src_install() {
	make prefix=${D}/usr install || die "install failed"
}
