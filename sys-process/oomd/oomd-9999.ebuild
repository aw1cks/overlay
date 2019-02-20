# Copyright 2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
inherit eapi7-ver
EAPI=6

MY_PN="oomd"
MY_P="${MY_PN}"

EGIT_REPO_URI="https://github.com/facebookincubator/oomd"
#EGIT_CHECKOUT_DIR=${WORKDIR}/${PN}

inherit git-r3 systemd

DESCRIPTION="userspace OOM killer"
HOMEPAGE="https://github.com/facebookincubator/oomd"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~ppc ~amd64"
IUSE=""

DEPEND="dev-util/meson dev-util/ninja dev-libs/jsoncpp"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
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
