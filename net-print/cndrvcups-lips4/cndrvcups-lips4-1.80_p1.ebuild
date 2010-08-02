# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit multilib eutils versionator

MY_P=${P/_p/-}
S=${WORKDIR}/${PN}-$(get_version_component_range 1-2)

DESCRIPTION="Canon LIPS4 Printer Driver"
HOMEPAGE="http://www.canon.com/"
SRC_URI="http://gdlp01.c-wss.com/gds/1/0100001351/02/cndrvcups-lips4-1.80-1.tar.gz"

LICENSE="CANON"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="=net-print/cndrvcups-common-1.80_p1"

src_compile() {
	for i in driver pstolipscpca ppd; do
		cd ${i}
		NOCONFIGURE=1 ./autogen.sh
		econf \
			--libdir=/usr/libexec
		emake
		cd ..
	done
}

src_install() {
	emake install DESTDIR=${D}
}
