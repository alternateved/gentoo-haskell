# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

# ebuild generated by hackport 0.6.9999
#hackport: flags: -bytestring-builder,-developer

CABAL_FEATURES="lib profile haddock hoogle hscolour" # broken test-suite
# break circular dependencies:
# https://github.com/gentoo-haskell/gentoo-haskell/issues/810
CABAL_FEATURES+=" nocabaldep"
inherit haskell-cabal

DESCRIPTION="An efficient packed Unicode text type"
HOMEPAGE="https://github.com/haskell/text"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0/${PV}"
# keep in sync with ghc-8.8
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE=""
# break cyclic dependencies, test suite requires porting to >=QC-2.11
RESTRICT=test
# ghc-8.10 requires text-1.2.3.2. Try to force the downgrade here.
RDEPEND=">=dev-lang/ghc-8.8:= <dev-lang/ghc-8.10:="

DEPEND="${RDEPEND}
"

CABAL_CORE_LIB_GHC_PV="PM:8.8.1 PM:8.8.2 PM:8.8.3 PM:8.8.4 PM:9999"
src_configure() {
	haskell-cabal_src_configure \
		--flag=-bytestring-builder \
		--flag=-developer
}