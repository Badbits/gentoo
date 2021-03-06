# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

EGO_PN=github.com/docker/${PN##*-}/...

if [[ ${PV} = *9999* ]]; then
	inherit golang-vcs
else
	KEYWORDS="~amd64"
	EGIT_COMMIT="v${PV}"
	SRC_URI="https://${EGO_PN%/*}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"
	inherit golang-vcs-snapshot
fi
inherit golang-build

DESCRIPTION="A Docker-native clustering system"
HOMEPAGE="https://docs.docker.com/${PN##*-}/"
LICENSE="Apache-2.0"
SLOT="0"
IUSE=""
RESTRICT="test"
DEPEND=""
RDEPEND=""
S=${WORKDIR}/${P}/src/${EGO_PN%/*}

src_compile() {
	GOPATH="${WORKDIR}/${P}:${S}/Godeps/_workspace:$(get_golibdir_gopath)" \
		go build -v -work -x ${EGO_BUILD_FLAGS} -o ${PN} || die
}

src_install() {
	dobin ${PN}
	dodoc CHANGELOG.md CONTRIBUTING.md README.md ROADMAP.md
}
