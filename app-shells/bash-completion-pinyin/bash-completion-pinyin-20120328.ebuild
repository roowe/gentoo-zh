# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-shells/bash-completion/bash-completion-1.3.ebuild,v 1.3 2011/03/09 11:55:40 hwoarang Exp $

EAPI=4
inherit bash-completion-r1

DESCRIPTION="chsdir completion for bash"
HOMEPAGE="http://code.google.com/p/easyscripts/"
SRC_URI="http://easyscripts.googlecode.com/files/chsdir_${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha amd64 ~arm hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~sparc-fbsd ~x86-fbsd ~x86-interix ~amd64-linux ~ia64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~m68k-mint ~sparc-solaris ~sparc64-solaris"
IUSE=""

DEPEND="=dev-lang/python-2*"
RDEPEND="app-admin/eselect
	|| ( >=app-shells/bash-3.2 app-shells/zsh )
	sys-apps/miscfiles"	 

PDEPEND="app-shells/gentoo-bashcomp"

RESTRICT="nomirror"

S="${WORKDIR}/${PN}"

src_install() {
	# Gentoo specific bash-completion.sh file.
	dodir /usr/bin
	install -c -D chsdir ${D}/usr/bin/chsdir
	newbashcomp chs_completion ${PN}
}
