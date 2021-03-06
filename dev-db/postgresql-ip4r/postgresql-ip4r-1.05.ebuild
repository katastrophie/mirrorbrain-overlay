# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

MY_PN="${PN/postgresql-}"
MY_P="${MY_PN}-${PV}"
S="${WORKDIR}/${MY_P}"

DESCRIPTION="IPv4 and IPv4 range index type for PostgreSQL"
HOMEPAGE="http://pgfoundry.org/projects/ip4r"
SRC_URI="http://pgfoundry.org/frs/download.php/2607/${MY_P}.tar.gz"

LICENSE="POSTGRESQL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="|| (
		>=dev-db/postgresql-base-8.2
		>=dev-db/postgresql-server-8.2
	)"
RDEPEND="${DEPEND}"

src_compile() {
	emake USE_PGXS=1 || die
}

src_install() {
	emake DESTDIR="${D}" USE_PGXS=1 install || die
	dodoc README.ip4r
}
