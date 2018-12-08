# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="6"
ETYPE="sources"
K_WANT_GENPATCHES="base extras experimental"
K_GENPATCHES_VER="9"
K_SECURITY_UNSUPPORTED="1"
K_DEBLOB_AVAILABLE="1"

PYTHON_COMPAT=( python2_7 )
inherit python-any-r1 kernel-2
detect_version
detect_arch

HOMEPAGE="https://dev.gentoo.org/~mpagano/genpatches/                                          http://kernel.kolivas.org/"
KEYWORDS="~amd64 ~x86"
IUSE="experimental"

DEPEND="deblob? ( ${PYTHON_DEPS} )"
K_BRANCH_ID="${KV_MAJOR}.${KV_MINOR}"
DESCRIPTION="Gentoo's genpatches for Linux ${K_BRANCH_ID}, with Con Kolivas' MuQSS process scheduler."
MUQSS_VERSION="180"
MUQSS_FILE="0001-MultiQueue-Skiplist-Scheduler-version-v0.${MUQSS_VERSION}.patch"
MUQSS_BASE_URL="http://ck.kolivas.org/patches/muqss/4.0"

# clearly identify package name in distdir
MUQSS_DISTNAME="${PN}-${K_BRANCH_ID}-muqss.patch"
CK_LVER_URL="${MUQSS_BASE_URL}/${K_BRANCH_ID}"
CK_URI="${CK_LVER_URL}/${MUQSS_FILE} -> ${MUQSS_DISTNAME}"
SRC_URI="${KERNEL_URI} ${GENPATCHES_URI} ${ARCH_URI} ${CK_URI}"
UNIPATCH_LIST="${DISTDIR}/${MUQSS_DISTNAME}"
UNIPATCH_STRICTORDER="yes"

pkg_setup() {
	use deblob && python-any-r1_pkg_setup
	kernel-2_pkg_setup
}

pkg_postinst() {
	kernel-2_pkg_postinst
	einfo "For more info on this patchset, and how to report problems, see:"
	einfo "${HOMEPAGE}"
}

pkg_postrm() {
	kernel-2_pkg_postrm
}
