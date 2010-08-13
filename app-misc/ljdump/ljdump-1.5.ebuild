# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Livejournal archive utility"
HOMEPAGE="http://hewgill.com/ljdump/"
SRC_URI="http://hewgill.com/ljdump/ljdump-1.5.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="dev-lang/python"

src_install() {
	dobin ljdump.py
	dodoc ljdump.config.sample
	dodoc README.txt
}
