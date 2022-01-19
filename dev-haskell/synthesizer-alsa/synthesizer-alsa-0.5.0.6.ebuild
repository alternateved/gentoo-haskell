# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# ebuild generated by hackport 0.7.9999
#hackport: flags: -optimizeadvanced,buildexamples:examples

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="Control synthesizer effects via ALSA/MIDI"
HOMEPAGE="https://www.haskell.org/haskellwiki/Synthesizer"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE="examples"

RDEPEND=">=dev-haskell/alsa-core-0.5:=[profile?] <dev-haskell/alsa-core-0.6:=[profile?]
	>=dev-haskell/alsa-pcm-0.6:=[profile?] <dev-haskell/alsa-pcm-0.7:=[profile?]
	>=dev-haskell/alsa-seq-0.6:=[profile?] <dev-haskell/alsa-seq-0.7:=[profile?]
	>=dev-haskell/event-list-0.1:=[profile?] <dev-haskell/event-list-0.2:=[profile?]
	>=dev-haskell/midi-0.2:=[profile?] <dev-haskell/midi-0.3:=[profile?]
	>=dev-haskell/midi-alsa-0.2:=[profile?] <dev-haskell/midi-alsa-0.3:=[profile?]
	>=dev-haskell/non-negative-0.1:=[profile?] <dev-haskell/non-negative-0.2:=[profile?]
	>=dev-haskell/numeric-prelude-0.3:=[profile?] <dev-haskell/numeric-prelude-0.5:=[profile?]
	>=dev-haskell/old-time-1.0:=[profile?] <dev-haskell/old-time-1.2:=[profile?]
	>=dev-haskell/random-1.0:=[profile?] <dev-haskell/random-1.3:=[profile?]
	>=dev-haskell/sox-0.2.1:=[profile?] <dev-haskell/sox-0.3:=[profile?]
	>=dev-haskell/storablevector-0.2.5:=[profile?] <dev-haskell/storablevector-0.3:=[profile?]
	>=dev-haskell/synthesizer-core-0.6:=[profile?] <dev-haskell/synthesizer-core-0.9:=[profile?]
	>=dev-haskell/synthesizer-dimensional-0.7:=[profile?] <dev-haskell/synthesizer-dimensional-0.9:=[profile?]
	>=dev-haskell/synthesizer-midi-0.6:=[profile?] <dev-haskell/synthesizer-midi-0.7:=[profile?]
	>=dev-haskell/utility-ht-0.0.1:=[profile?] <dev-haskell/utility-ht-0.1:=[profile?]
	>=dev-lang/ghc-8.4.3:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-2.2.0.1
"

src_configure() {
	haskell-cabal_src_configure \
		$(cabal_flag examples buildexamples) \
		--flag=-optimizeadvanced
}
