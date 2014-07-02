# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

# ebuild generated by hackport 0.4.2.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="Reverse proxy HTTP requests, either over raw sockets or with WAI"
HOMEPAGE="https://github.com/fpco/http-reverse-proxy"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-haskell/async:=[profile?]
	>=dev-haskell/blaze-builder-0.3:=[profile?]
	>=dev-haskell/case-insensitive-0.4:=[profile?]
	>=dev-haskell/conduit-1.1:=[profile?]
	dev-haskell/conduit-extra:=[profile?]
	dev-haskell/data-default-class:=[profile?]
	>=dev-haskell/http-client-0.3:=[profile?]
	>=dev-haskell/http-types-0.6:=[profile?]
	>=dev-haskell/lifted-base-0.1:=[profile?]
	>=dev-haskell/monad-control-0.3:=[profile?]
	dev-haskell/network:=[profile?]
	dev-haskell/resourcet:=[profile?]
	dev-haskell/streaming-commons:=[profile?]
	>=dev-haskell/text-0.11:=[profile?]
	dev-haskell/transformers:=[profile?]
	>=dev-haskell/wai-3.0:=[profile?]
	dev-haskell/wai-logger:=[profile?]
	>=dev-haskell/word8-0.0:=[profile?]
	>=dev-lang/ghc-7.4.1:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.8
	test? ( >=dev-haskell/hspec-1.3
		dev-haskell/http-conduit
		dev-haskell/network-conduit
		>=dev-haskell/warp-2.1 )
"
