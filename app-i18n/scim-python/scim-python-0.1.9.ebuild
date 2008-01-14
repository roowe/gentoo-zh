# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit autotools eutils

DESCRIPTION="A python wrapper for Smart Common Input Method (SCIM)"
HOMEPAGE="http://code.google.com/p/scim-python/"
SRC_URI="http://scim-python.googlecode.com/files/${P}.tar.bz2"
RESTRICT="mirror"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~ppc ~sparc ~x86"
IUSE="nls pinyin shuangpin enwriter"

RDEPEND="x11-libs/libXt
	enwriter? ( dev-python/pyenchant )
	|| ( >=app-i18n/scim-1.1 >=app-i18n/scim-cvs-1.1 )
	nls? ( virtual/libintl )
	"
DEPEND="${RDEPEND}
	dev-util/pkgconfig
	nls? ( sys-devel/gettext )"


src_unpack() {
	unpack ${A}
	cd "${S}"

	AT_NO_RECURSIVE=yes AT_M4DIR=${S}/m4 eautoreconf
}

src_compile() {
	econf \
		$(use_enable pinyin) \
		$(use_enable shuangpin) \
		$(use_enable nls) \
		$(use_enable enwriter english-writer) \
		--disable-static \
		--disable-dependency-tracking \
		|| die "econf failed"
	emake || die "make failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "install failed"
	dodoc README ChangeLog AUTHORS NEWS TODO
}