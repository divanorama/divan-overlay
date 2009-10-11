DESCRIPTION="Tools to remount root in rw/ro."
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=""
RDEPEND=""

src_install() {
	dodir /mnt/rwroot || die
	cd ${FILESDIR} || die
	dosbin enter_do_rw || die
	dosbin enter_rw || die
	dosbin in_rw || die
	dosbin go_rw || die
	dosbin exit_rw || die
}
