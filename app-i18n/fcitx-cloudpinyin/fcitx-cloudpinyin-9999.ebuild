# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit cmake-utils git

EGIT_REPO_URI="git://github.com/fcitx/fcitx-cloudpinyin.git"

DESCRIPTION="This is a standalone module for fcitx,it can use pinyin API on the internet to input."
HOMEPAGE="https://github.com/fcitx/fcitx-cloudpinyin"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND=">=app-i18n/fcitx-4.2.5"
DEPEND="${RDEPEND}
	dev-util/intltool"

