inherit eutils

EAPI="2"
DESCRIPTION="Qi bootloader image"
HOMEPAGE="http://wiki.openmoko.org/wiki/Qi"
SRC_URI="http://git.openmoko.org/?p=qi.git;a=snapshot;h=ddbd173a92ce5fcc282e0951e90ff981ebb9969d -> qi.ddbd173a92ce5fcc282e0951e90ff981ebb9969d.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=">=sys-devel/crossdev-0.9.1"
RDEPEND=""

src_unpack() {
	unpack "${A}" || die
	cd qi.git || die
	epatch ${FILESDIR}/config_mk.patch
	epatch ${FILESDIR}/version.patch
}

src_compile() {
	type -p armv4tl-softfloat-linux-gnueabi-gcc > /dev/null || die \
		"run crossdev -t armv4tl-softfloat-linux-gnueabi";
	cd qi.git || die
	emake CPU=s3c2442 || die
}

src_install() {
	dodoc qi.git/README
	insinto /usr/share/qi
	doins qi.git/image/*.udfu || die
}
