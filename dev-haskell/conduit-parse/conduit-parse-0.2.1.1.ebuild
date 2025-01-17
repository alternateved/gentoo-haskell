# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# ebuild generated by hackport 0.7.1.1.9999
#hackport: flags:enable-hlint-test:test
CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="Parsing framework based on conduit"
HOMEPAGE="https://github.com/k0ral/conduit-parse"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="WTFPL-2"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-haskell/conduit-1.3:=[profile?]
	dev-haskell/dlist:=[profile?]
	dev-haskell/parsers:=[profile?]
	dev-haskell/safe:=[profile?]
	dev-haskell/safe-exceptions:=[profile?]
	>=dev-lang/ghc-8.4.3:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-2.2.0.1
	test? ( dev-haskell/resourcet
		dev-haskell/tasty
		dev-haskell/tasty-hunit
		dev-haskell/hlint )
"

src_configure() {
	haskell-cabal_src_configure \
		$(cabal_flag test enable-hlint-test)
}
