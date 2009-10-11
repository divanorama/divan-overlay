inherit git

EGIT_REPO_URI="git://git.openmoko.org/git/qi.git"

DESCRIPTION="Qi bootloader image"
HOMEPAGE="http://wiki.openmoko.org/wiki/Qi"
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=">=sys-devel/crossdev-0.9.1"
RDEPEND=""

src_unpack() {
	git_src_unpack
	cd "${S}"
	epatch ${FILESDIR}/config_mk.patch
}

src_compile() {
	type -p armv4tl-softfloat-linux-gnueabi-gcc > /dev/null || die \
		"run crossdev -t armv4tl-softfloat-linux-gnueabi";
	emake CPU=s3c2442 || die
}

src_install() {
	dodoc ${S}/README
	insinto /usr/share/qi
	doins ${S}/image/*.udfu || die
}
