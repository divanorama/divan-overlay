# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI="5"
PYTHON_COMPAT=( python{2_7,3_2,3_3,3_4} pypy )

inherit git-2
inherit distutils-r1

DESCRIPTION="Remember The Milk API"
HOMEPAGE="https://bitbucket.org/egh/ledger-autosync"
EGIT_REPO_URI="git://github.com/egh/ledger-autosync.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=''

DEPEND="
>=dev-python/nose-1.0
dev-python/mock
"
RDEPEND="${DEPEND}
dev-python/ofxparse
dev-python/ofxclient
dev-python/ofxhome
dev-python/keyring
>=app-office/ledger-3
"

src_prepare() {
#	rm -f "${S}"/setup.cfg # This confuses setuptools in Gentoo
#	use examples || sed '/rtm_appsample/d' -i "${S}"/setup.py
	distutils-r1_src_prepare
}
