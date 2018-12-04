# Copyright 2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

EGIT_REPO_URI="git://github.com/aw1cks/schedtoold.git"

inherit cmake-utils git-r3 systemd

DESCRIPTION="schedtool daemon"
HOMEPAGE="http://web.archive.org/web/20160407010156/http://www.darav.de/schedtoold.html"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~ppc ~amd64"
IUSE=""

DEPEND="sys-process/schedtool"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	make
}

src_install() {
	dobin schedtoold
	dodoc ChangeLog COPYING AUTHORS README example/schedtoold.conf
	systemd_dounit init-scripts/systemd/schedtoold.service
}

