# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-2

DESCRIPTION="MeloSynth is a python script to synthesize melodies represented as a sequence of pitch (frequency) values."
HOMEPAGE="http://www.justinsalamon.com"
EGIT_REPO_URI="git://github.com/justinsalamon/melosynth.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND} dev-lang/python dev-python/numpy"

src_install() {
	dobin ${S}/melosynth.py
}
