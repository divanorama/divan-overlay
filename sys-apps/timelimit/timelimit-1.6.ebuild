# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Limit a process's absolute execution time"
HOMEPAGE="http://devel.ringlet.net/sysutils/timelimit/"
SRC_URI="http://devel.ringlet.net/sysutils/${PN}/${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=""

src_install() {
	dobin timelimit
	doman timelimit.1
}
