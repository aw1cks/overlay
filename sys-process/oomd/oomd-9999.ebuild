# Copyright 2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

EGIT_REPO_URI="https://github.com/facebookincubator/oomd"
EGIT_CHECKOUT_DIR=${WORKDIR}/oomd

inherit git-r3 systemd

DESCRIPTION="schedtool daemon"
HOMEPAGE="http://web.archive.org/web/20160407010156/http://www.darav.de/schedtoold.html"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~ppc ~amd64"
IUSE=""

DEPEND="dev-util/meson dev-util/ninja dev-libs/jsoncpp"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	cd oomd
	meson build
	ninja -C build
}

src_install() {
	into /usr/local/bin/
	dobin oomd/build/oomd_bin

	into /usr/local/lib64/
	dolib.so oomd/build/liboomd.so

	systemd_dounit etc/oomd.service
}

