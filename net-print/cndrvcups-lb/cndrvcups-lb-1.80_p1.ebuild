# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit multilib eutils versionator

MY_P=${P/_p/-}
S=${WORKDIR}/${PN}-$(get_version_component_range 1-2)

DESCRIPTION="Canon UFR II / LIPSLX Printer Driver"
HOMEPAGE="http://www.canon.com/"
SRC_URI="http://gdlp01.c-wss.com/gds/0/0100001350/02/${MY_P}.tar.gz"

LICENSE="CANON"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="=net-print/cndrvcups-common-1.80_p1"

src_compile() {
	for i in ppd pstoufr2cpca; do
		cd ${i}
		NOCONFIGURE=1 ./autogen.sh
		econf \
			--libdir=/usr/libexec/
		emake
		cd ..
	done
}

src_install() {
	emake install DESTDIR=${D}

	OABI=${ABI}
        has_multilib_profile && ABI="x86"
	for i in `cd libs; ls *.so.?.?.?; cd ..`; do
		dolib.so libs/${i}
		dosym ${i} /usr/$(get_libdir)/${i%.?.?}		# Fix the version stuff of libs
		dosym ${i} /usr/$(get_libdir)/${i%.?.?.?}
	done

	insinto /usr/share/caepcm
	doins data/*
}
