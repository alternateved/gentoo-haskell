# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

# ebuild generated by hackport 0.6.7.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour " #test-suite"
inherit haskell-cabal

DESCRIPTION="Automatically discover and run Hspec tests"
HOMEPAGE="http://hspec.github.io/"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RESTRICT="test" # needs new quickcheck-2.14 (because of hspec-meta)

RDEPEND=">=dev-lang/ghc-8.4.3:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-2.2.0.1
"
	# test? ( >=dev-haskell/hspec-meta-2.3.2
	# 	>=dev-haskell/quickcheck-2.7 )
# "
