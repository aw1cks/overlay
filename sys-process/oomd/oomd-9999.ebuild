# Copyright 2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
EAPI=6

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

src_prepare() {
	mkdir ../oomd
	mv -f ./* ../oomd
	mkdir oomd
	mv -f ../oomd/* oomd
	rmdir ../oomd
	eapply_user
}

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

	systemd_dounit oomd/etc/oomd.service
}
