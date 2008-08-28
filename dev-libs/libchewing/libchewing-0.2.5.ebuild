# Copyright 1999-2004 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /home/cvsroot/ebuildteam/dev-libs/libchewing/libchewing-0.2.5.ebuild,v 1.3 2005/08/21 03:57:19 scsi Exp $

inherit flag-o-matic eutils

IUSE=""
DESCRIPTION="Library for Chinese Phonetic input method"
HOMEPAGE="http://chewing.csie.net/"
SRC_URI="http://chewing.csie.net/download/libchewing/${P}.tar.gz"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="ppc x86"
DEPEND="virtual/libc"

src_compile() {
	econf || die "./configure failed"
	emake -j1 || die "make failed"
}

src_install() {
	make install DESTDIR=${D} || die "install failed"
}