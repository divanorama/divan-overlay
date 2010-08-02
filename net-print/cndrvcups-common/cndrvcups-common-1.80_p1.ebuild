# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit multilib eutils rpm versionator
MY_P=${P/_p/-}
DESCRIPTION="Common files for the Canon CUPS Capt driver"
HOMEPAGE="http://www.canon.com/"
SRC_URI="http://gdlp01.c-wss.com/gds/8/0100001348/02/${MY_P}.tar.gz"
LICENSE="CANON"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT=""

DEPEND=">=net-print/cups-1.1.17"
S=${WORKDIR}/${PN}-$(get_version_component_range 1-2)

dir=/usr/$(get_libdir)

QA_TEXTRELS="${dir:1}/libcaepcm.so.1.0
	${dir:1}/libc3pl.so.0.0.1
	${dir:1}/libcnlbcm.so.1.0
	${dir:1}/libcaiousb.so.1.0.0"

src_compile() {
	for i in buftool cpca; do
		cd ${i}
		NOCONFIGURE=1 ./autogen.sh
		econf
		emake
		cd ..
	done

	cd c3plmod_ipc
	emake
	cd ..
}

src_install() {
	for i in buftool cpca; do
		cd ${i}
		make install DESTDIR=${D} || die "make install failed for ${i}" 
		cd ..
	done

	# Install the libs
	OABI=${ABI}
	has_multilib_profile && ABI="x86"
	for i in `cd libs; ls *.so.?.?.?; cd ..`; do
		# Hmm.. Shouldn't these go to lib32 instead?
		dolib.so libs/${i}
		dosym ${i} /usr/$(get_libdir)/${i%.?.?}		# Fix the version stuff of libs
		dosym ${i} /usr/$(get_libdir)/${i%.?.?.?}
	done
	for i in `cd libs; ls *.so.?.?; cd ..`; do
		# Hmm.. Shouldn't these go to lib32 instead?
		dolib.so libs/${i}
		dosym ${i} /usr/$(get_libdir)/${i%.?.?}		# Fix the version stuff of libs
	done

	dolib.so c3plmod_ipc/libcanonc3pl.so.1.0.0
	dosym  libcanonc3pl.so /usr/$(get_libdir)/libcanonc3pl.so.1.0.0
	
	dobin libs/cnpkmodule
	dobin libs/c3pldrv 

	ABI=${OABI}

	# Install the data
	insinto /usr/share/caepcm
	doins data/*


	dodoc LICENSE-common-*.txt README
	for i in buftool cpca c3plmod_ipc; do
		docinto ${i}
		dodoc ${i}/NEWS ${i}/README ${i}/AUTHORS ${i}/ChangeLog
	done

	docinto buftool
	dodoc buftool/LICENSE.txt
}
