# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

VIRTUALX_REQUIRED="test"
inherit kde5

DESCRIPTION="Framework providing data models that help with tasks such as sorting and filtering"
LICENSE="LGPL-2+"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="test? ( dev-qt/qtwidgets:5 )"
