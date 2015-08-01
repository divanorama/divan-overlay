# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit elisp-common versionator

PV1=$(get_version_component_range 1-2 )
PV2=$(get_version_component_range 3 )
PV3=$(get_version_component_range 4-6 )
PV4=$(get_version_component_range 7-8 )
PV1=$(replace_version_separator 1 'r' ${PV1} )
PV3=$(replace_all_version_separators '_' ${PV3} )
PV4=$(replace_all_version_separators '_' ${PV4} )
PVX=${PV1}p${PV2}_${PV3}-${PV4}

DESCRIPTION="System for computational discrete algebra"
HOMEPAGE="http://www.gap-system.org/"
SRC_URI="ftp://ftp.gap-system.org/pub/gap/gap4/tar.bz2/${PN}${PVX}.tar.bz2"

SLOT="0"
IUSE="emacs vim-syntax"
LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	emacs? ( virtual/emacs )
	vim-syntax? ( || ( app-editors/vim app-editors/gvim ) )"
DEPEND="${RDEPEND}"

S="${WORKDIR}"/${PN}${PV1}

src_configure() {
	GAP_ABI="32";
	if [[ ${ABI} == "amd64" ]]; then
		GAP_ABI="64"
	fi;
	econf ABI=${GAP_ABI}
}

src_compile() {
	emake -j1 CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}" ABI=${GAP_ABI} compile manuals || die "emake failed"
}

src_test() {
	emake teststandard || die "test failed"
}

src_install() {
	cp doc/changes/manual.pdf changes.pdf
	cp doc/ref/manual.pdf reference.pdf
	cp doc/tut/manual.pdf manual.pdf
	dodoc changes.pdf reference.pdf manual.pdf
	insinto /usr/share/${PN}
	doins -r grp lib pkg prim small trans tst sysinfo.gap
	source sysinfo.gap
	exeinto /usr/libexec/${PN}
	doexe bin/${GAParch}/gap
	sed -e "s|@gapdir@|/usr/share/${PN}|" \
		-e "s|@GAPARCH@|/usr/libexec/${PN}|" \
		-e "s|@EXEEXT@||" \
		-e 's|$GAP_DIR/bin/||' \
		gap.shi > gap
	exeinto /usr/bin
	doexe gap

	if use emacs ; then
		elisp-site-file-install etc/emacs/gap-mode.el
		elisp-site-file-install etc/emacs/gap-process.el
		elisp-site-file-install "${FILESDIR}"/64gap-gentoo.el
		dodoc etc/emacs/gap-mode.doc
	fi

	if use vim-syntax ; then
		insinto /usr/share/vim/vimfiles/syntax
		doins etc/gap.vim
		insinto /usr/share/vim/vimfiles/indent
		newins etc/gap_indent.vim gap.vim
		insinto /usr/share/vim/vimfiles/plugin
		newins etc/debug.vim debug_gap.vim
		dodoc etc/README.vim-utils etc/debugvim.txt
	fi
}

pkg_postinst() {
	use emacs && elisp-site-regen
}

pkg_postrm() {
	use emacs && elisp-site-regen
}
