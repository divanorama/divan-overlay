inherit subversion

ESVN_REPO_URI="https://mcalib.svn.sourceforge.net/svnroot/mcalib/"

DESCRIPTION="Tools to calibrate monitor on linux with Pantone Huey"
HOMEPAGE="http://sourceforge.net/projects/mcalib/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"

DEPEND="dev-util/scons"
RDEPEND="
media-libs/libsdl
x11-libs/libXxf86vm
dev-libs/ccmath
"

src_compile() {
	scons || die "scons failed"
}

src_install() {
	dobin mcalib || die "installing the binary failed"
	dobin mgramp || die "installing the binary failed"
	dodoc INSTALL LICENSE README
}
