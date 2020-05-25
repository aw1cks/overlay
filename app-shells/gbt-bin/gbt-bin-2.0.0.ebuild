# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Highly configurable prompt builder for Bash, ZSH and PowerShell written in Go. "
HOMEPAGE="https://github.com/jtyr/gbt"
SRC_URI="
        https://github.com/jtyr/gbt/releases/download/v${PV}/gbt-${PV}-linux-amd64.tar.gz -> ${P}.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND="
		dev-vcs/git
		|| ( app-shells/zsh app-shells/bash )
"

src_unpack() {
	unpack ${A}
	mv "gbt-${PV}" "gbt-bin-${PV}"
}

src_install() {
	dobin gbt
}
