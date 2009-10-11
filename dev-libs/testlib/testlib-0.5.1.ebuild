# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit subversion

DESCRIPTION="C++ testlib library to create checkers for ACM problems."
HOMEPAGE="http://testlib.googlecode.com"
ESVN_REPO_URI="http://testlib.googlecode.com/svn/trunk@2"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+examples"

DEPEND=""
RDEPEND=""

src_unpack() {
	subversion_src_unpack || die
	epatch "${FILESDIR}/testlib-r2.patch" || die
}
src_install() {
	insinto /usr/include/testlib
	doins testlib.h || die
	use examples && {
		sed -i -e 's/#include "testlib.h"/#include <testlib\/testlib.h>/' \
			prewritten/*.cpp || die
		docinto examples
		dodoc prewritten/*.cpp
	}
}
