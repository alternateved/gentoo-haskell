# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# ebuild generated by hackport 0.7.1.1.9999
#hackport: flags: -pedantic

CABAL_FEATURES="lib profile haddock hoogle hscolour" # test-suite
inherit haskell-cabal

# hololeap (2022-04-30)
# TODO: Many tests fail and should be investigated
# > 61 out of 64 tests failed (389.34s)
RESTRICT="test"

DESCRIPTION="Eval plugin for Haskell Language Server"
HOMEPAGE="https://hackage.haskell.org/package/hls-eval-plugin"

LICENSE="Apache-2.0"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	dev-haskell/aeson:=[profile?]
	dev-haskell/data-default:=[profile?]
	>=dev-haskell/diff-0.4.0:=[profile?] <dev-haskell/diff-0.5:=[profile?]
	dev-haskell/dlist:=[profile?]
	dev-haskell/extra:=[profile?]
	dev-haskell/ghc-paths:=[profile?]
	>=dev-haskell/ghcide-1.7:=[profile?] <dev-haskell/ghcide-1.8:=[profile?]
	dev-haskell/hashable:=[profile?]
	dev-haskell/hls-graph:=[profile?]
	>=dev-haskell/hls-plugin-api-1.4:=[profile?] <dev-haskell/hls-plugin-api-1.5:=[profile?]
	dev-haskell/lens:=[profile?]
	dev-haskell/lsp:=[profile?]
	dev-haskell/lsp-types:=[profile?]
	>=dev-haskell/megaparsec-9.0:=[profile?]
	dev-haskell/parser-combinators:=[profile?]
	dev-haskell/pretty-simple:=[profile?]
	dev-haskell/quickcheck:2=[profile?]
	dev-haskell/safe-exceptions:=[profile?]
	dev-haskell/unliftio:=[profile?]
	dev-haskell/unordered-containers:=[profile?]
	>=dev-lang/ghc-8.6.3:=
"
DEPEND="
	${RDEPEND}
	>=dev-haskell/cabal-2.4.0.1
"
#	test? (
#		>=dev-haskell/hls-test-utils-1.3 <dev-haskell/hls-test-utils-1.4
#	)

src_configure() {
	haskell-cabal_src_configure \
		--flag=-pedantic
}
