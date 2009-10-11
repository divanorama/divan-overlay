DESCRIPTION="Reuse library."
HOMEPAGE="http://www.ejudge.ru"
SRC_URI="http://www.ejudge.ru/download/${P}.tgz"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=""

src_compile () {
	cd reuse/source || die
	econf || die "econf failed"
	emake || die "emake failed"
}

src_install () {
	cd reuse/source || die
	emake DESTDIR=${D} install || die
}
