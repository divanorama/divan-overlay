# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Tester - windows ACM solutions tester."
HOMEPAGE="http://acm.timus.ru/tester"
SRC_URI="http://acm.timus.ru/tester/tester${PV}.rar"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
 app-text/recode
 app-arch/unrar
"
RDEPEND="app-emulation/wine"

src_unpack() {
	unpack ${A} || die
}
src_install() {
	dobin \!test.exe || die
	dobin ${FILESDIR}/\!test || die
	recode -f cp1251 readme.txt || die
	dodoc readme.txt
	docinto examples
	dodoc \!test.ini
}
