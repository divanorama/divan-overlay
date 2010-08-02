# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Canon capt driver."
HOMEPAGE="http://debian.are-ata.org/capt/"
SRC_URI="http://www.are-ata.org/debian/capt/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="cups"

DEPEND=""
RDEPEND="cups? ( net-print/foomatic-filters )
	virtual/ghostscript"

src_compile() {
	cd capt 
	emake || die
}

src_install() {
	cd capt
	dobin capt || die
	dobin capt-print || die
	insinto /etc
	doins etc/capt.conf || die
	einfo "Don't forget to specify printer device in /etc/capt.conf".
	use cups && insinto /usr/share/cups/model
	use cups && doins ppd/*.ppd || die
	use cups && einfo "Add printer like lpadmin -p LBP1120 -m Canon-LBP-810-capt.ppd -v file:///dev/null"
}
