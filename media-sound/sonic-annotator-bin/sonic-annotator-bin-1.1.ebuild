# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Sonic Annotator is a batch tool for feature extraction and annotation of audio files using Vamp plugins."
HOMEPAGE="http://www.vamp-plugins.org/sonic-annotator/"
SRC_URI="https://code.soundsoftware.ac.uk/attachments/download/1197/sonic-annotator-1.1-linux-amd64.tar.gz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_unpack() {
	mkdir ${S}
	cd ${S}
	unpack ${A}
}
src_install() {
	dobin sonic-annotator
}
