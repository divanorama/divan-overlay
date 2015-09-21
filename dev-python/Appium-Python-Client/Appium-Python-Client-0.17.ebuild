EAPI="5"

inherit distutils

MY_PN="Appium-Python-Client"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Python client for Appium 1.4"
HOMEPAGE="http://appium.io/"
SRC_URI="https://pypi.python.org/packages/source/A/Appium-Python-Client/${MY_P}.tar.gz"
LICENSE="Apache-2.0"
KEYWORDS="~x86 ~amd64"
SLOT="0"
IUSE=""

RDEPEND="
|| ( dev-python/enum34 dev-python/python:3.4 )
dev-python/selenium
"
