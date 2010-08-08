# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="SVMLight"
HOMEPAGE="http://svmlight.joachims.org/"
SRC_URI="http://kodiak.cs.cornell.edu/svm_light/v6.02/svm_light.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=""
RDEPEND=""

src_install() {
	dobin svm_learn || die
	dobin svm_classify || die
}
