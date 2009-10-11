inherit eutils

DESCRIPTION="http://sourceforge.net/projects/mcalib/"
HOMEPAGE="http://sourceforge.net/projects/mcalib/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"

DEPEND="dev-util/scons"
RDEPEND="
media-libs/libsdl
x11-libs/libXxf86vm
dev-libs/ccmath
"
src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch ${FILESDIR}/${P}-*.patch
}

src_compile() {
	scons || die "scons failed"
}

src_install() {
	dobin mcalib || die "installing the binary failed"
	dobin mgramp || die "installing the binary failed"
	dodoc INSTALL LICENSE README
}
