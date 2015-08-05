# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI="5"
PYTHON_COMPAT=( python{2_7,3_2,3_3,3_4} pypy )

inherit distutils-r1

DESCRIPTION="Remember The Milk API"
HOMEPAGE="https://bitbucket.org/egh/ledger-autosync"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=''

DEPEND="
>=dev-python/nose-1.0
dev-python/mock
"
RDEPEND="${DEPEND}"

src_prepare() {
#	rm -f "${S}"/setup.cfg # This confuses setuptools in Gentoo
#	use examples || sed '/rtm_appsample/d' -i "${S}"/setup.py
	distutils-r1_src_prepare
}
