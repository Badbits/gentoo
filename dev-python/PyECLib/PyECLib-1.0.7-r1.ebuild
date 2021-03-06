# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="Messaging API for RPC and notifications over a number of different messaging transports"
HOMEPAGE="https://pypi.python.org/pypi/PyECLib"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="dev-libs/liberasurecode"

PATCHES=(
	"${FILESDIR}/1.0.7-erasurecode_locations.patch"
	"${FILESDIR}/PyECLib-usr-local.patch"
)

python_install() {
	distutils-r1_python_install
	# sed -i "s/^libdir.*$/libdir='\/usr\/lib'/g" "${D}"/usr/lib/libgf_complete.la || die
	# sed -i "s/^dependency_libs.*$/dependency_libs=''/g" "${D}"/usr/lib/libgf_complete.la "${D}"/usr/lib/libJerasure.la || die
	# package installs broken la files...
	rm "${D}"/usr/lib/*.la || die
}
