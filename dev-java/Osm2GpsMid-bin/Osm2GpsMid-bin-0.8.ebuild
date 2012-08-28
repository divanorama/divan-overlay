# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit java-pkg-2 java-ant-2

DESCRIPTION="Osm2GpsMid"
HOMEPAGE="http://sourceforge.net/apps/mediawiki/gpsmid/index.php?title=Properties_file"

SLOT="map72"

MY_PV="Osm2GpsMid-${PV}-${SLOT}"

SRC_URI="http://sourceforge.net/projects/gpsmid/files/gpsmid/Release%20${PV}/${MY_PV}.jar"

LICENSE="GPL-2"
KEYWORDS="~x86 ~amd64"

IUSE=""

COMMON_DEP=""

RDEPEND=">=virtual/jre-1.4
	${COMMON_DEP}"
DEPEND=">=virtual/jdk-1.4
	${COMMON_DEP}"

EANT_BUILD_TARGET=""
EANT_DOC_TARGET=""

src_unpack() {
	mkdir "${S}"
}

src_install() {
	java-pkg_newjar "${DISTDIR}/${MY_PV}.jar"
	java-pkg_dolauncher "${MY_PV}"
}
