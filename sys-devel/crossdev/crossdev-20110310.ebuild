# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-devel/crossdev/crossdev-20100814.ebuild,v 1.3 2011/02/06 11:31:49 leio Exp $

EAPI="3"

if [[ ${PV} == "99999999" ]] ; then
	EGIT_REPO_URI="git://github.com/divanorama/crossdev.git"
	EGIT_BRANCH="crossdev_overlay"
	inherit git
	SRC_URI=""
	#KEYWORDS=""
else
	EGIT_REPO_URI="git://github.com/divanorama/crossdev.git"
	EGIT_BRANCH="crossdev_overlay-${PV}"
	inherit git
	SRC_URI=""
	KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~x86-fbsd"
fi

DESCRIPTION="Gentoo Cross-toolchain generator"
HOMEPAGE="http://www.gentoo.org/"

LICENSE="GPL-2"
SLOT="0"
IUSE=""

RDEPEND=">=sys-apps/portage-2.1
	app-shells/bash
	!sys-devel/crossdev-wrappers"
DEPEND="app-arch/xz-utils"

src_install() {
	emake install DESTDIR="${D}" || die
}
