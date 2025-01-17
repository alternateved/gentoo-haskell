# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# ebuild generated by hackport 0.7.1.1.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="Show, plot and compare benchmark results"
HOMEPAGE="https://github.com/composewell/bench-show"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE="+charts +colors"

RDEPEND=">=dev-haskell/csv-0.1:=[profile?] <dev-haskell/csv-0.2:=[profile?]
	>=dev-haskell/mwc-random-0.13:=[profile?] <dev-haskell/mwc-random-0.16:=[profile?]
	>=dev-haskell/optparse-applicative-0.14.2:=[profile?] <dev-haskell/optparse-applicative-0.18:=[profile?]
	>=dev-haskell/optparse-simple-0.1.0:=[profile?] <dev-haskell/optparse-simple-0.2:=[profile?]
	>=dev-haskell/split-0.2:=[profile?] <dev-haskell/split-0.3:=[profile?]
	>=dev-haskell/statistics-0.15:=[profile?] <dev-haskell/statistics-0.17:=[profile?]
	>=dev-haskell/vector-0.10:=[profile?] <dev-haskell/vector-0.13:=[profile?]
	>=dev-lang/ghc-8.4.3:=
	charts? ( >=dev-haskell/chart-1.6:=[profile?] <dev-haskell/chart-2:=[profile?]
			>=dev-haskell/chart-diagrams-1.6:=[profile?] <dev-haskell/chart-diagrams-2:=[profile?] )
	colors? ( >=dev-haskell/ansi-wl-pprint-0.6:=[profile?] <dev-haskell/ansi-wl-pprint-0.7:=[profile?] )
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-2.2.0.1
"

src_configure() {
	# Convert 'no-charts' and 'no-colors' flags to 'charts' and 'colors'
	if use charts; then
		charts_flag="--flag=-no-charts"
	else
		charts_flag="--flag=no-charts"
	fi

	if use colors; then
		colors_flag="--flag=-no-colors"
	else
		colors_flag="--flag=no-colors"
	fi

	haskell-cabal_src_configure \
		"${charts_flag}" \
		"${colors_flag}"
}
