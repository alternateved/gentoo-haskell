# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

# ebuild generated by hackport 0.6.4

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="A formatter for Haskell source code"
HOMEPAGE="https://github.com/tweag/ormolu"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE="dev"

RDEPEND=">=dev-haskell/dlist-0.8:=[profile?] <dev-haskell/dlist-0.9:=[profile?]
	>=dev-haskell/exceptions-0.6:=[profile?] <dev-haskell/exceptions-0.11:=[profile?]
	>=dev-haskell/ghc-lib-parser-8.8.1:=[profile?] <dev-haskell/ghc-lib-parser-8.9:=[profile?]
	>=dev-haskell/gitrev-1.3:=[profile?] <dev-haskell/gitrev-1.4:=[profile?]
	>=dev-haskell/mtl-2.0:=[profile?] <dev-haskell/mtl-3.0:=[profile?]
	>=dev-haskell/optparse-applicative-0.14:=[profile?] <dev-haskell/optparse-applicative-0.16:=[profile?]
	>=dev-haskell/syb-0.7:=[profile?] <dev-haskell/syb-0.8:=[profile?]
	>=dev-haskell/text-0.2:=[profile?] <dev-haskell/text-1.3:=[profile?]
	>=dev-lang/ghc-8.6.3:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-2.4.0.1
	test? ( >=dev-haskell/hspec-2.0 <dev-haskell/hspec-3.0
		>=dev-haskell/path-0.6 <dev-haskell/path-0.8
		>=dev-haskell/path-io-1.4.2 <dev-haskell/path-io-2.0 )
"

src_configure() {
	haskell-cabal_src_configure \
		$(cabal_flag dev dev)
}
