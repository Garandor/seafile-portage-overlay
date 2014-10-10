# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# Created by Martin Kupec

EAPI=5

inherit autotools-utils python

RELEASE_COMMIT_HASH="8998e7b2c5587f0b94c48db24e2952d08def5add"

DESCRIPTION="RPC library for Seafile"
HOMEPAGE="http://www.seafile.com"
SRC_URI="https://github.com/haiwen/${PN}/archive/${RELEASE_COMMIT_HASH}.tar.gz -> ${PN}-${RELEASE_COMMIT_HASH}.tar.gz"

SLOT="0"
LICENSE="GPL-3"
KEYWORDS="~x86 ~amd64"

DEPEND="<dev-lang/python-3
	>=dev-libs/glib-2.16
	>=dev-libs/jansson-2.1.1
	virtual/pkgconfig"

RDEPEND=""

AUTOTOOLS_AUTORECONF=1

PATCHES=(
	"${FILESDIR}"/libsearpc.pc.patch
)

S="${WORKDIR}/${PN}-${RELEASE_COMMIT_HASH}"

pkg_setup() {
	python_set_active_version 2
	python_pkg_setup
}
