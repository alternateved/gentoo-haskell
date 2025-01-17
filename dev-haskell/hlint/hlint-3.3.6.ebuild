# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# ebuild generated by hackport 0.7.9999
#hackport: flags: -ghc-lib

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal elisp-common optfeature

DESCRIPTION="Source code suggestions"
HOMEPAGE="https://github.com/ndmitchell/hlint#readme"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE="emacs +gpl hsyaml test"

PATCHES=( "${FILESDIR}/${PN}-3.3.6-change-refactor-name.patch" )

# Test fails when HsYAML is used
REQUIRED_USE="test? ( !hsyaml )"

RDEPEND=">=dev-haskell/aeson-1.1.2.0:=[profile?]
	>=dev-haskell/ansi-terminal-0.8.1:=[profile?]
	>=dev-haskell/cmdargs-0.10:=[profile?]
	>=dev-haskell/cpphs-1.20.1:=[profile?]
	>=dev-haskell/data-default-0.3:=[profile?]
	>=dev-haskell/extra-1.7.3:=[profile?]
	dev-haskell/file-embed:=[profile?]
	>=dev-haskell/filepattern-0.1.1:=[profile?]
	>=dev-haskell/ghc-lib-parser-9.0:=[profile?] <dev-haskell/ghc-lib-parser-9.1:=[profile?]
	>=dev-haskell/ghc-lib-parser-ex-9.0.0.4:=[profile?] <dev-haskell/ghc-lib-parser-ex-9.0.1:=[profile?]
	>=dev-haskell/refact-0.3:=[profile?]
	dev-haskell/text:=[profile?]
	>=dev-haskell/uniplate-1.5:=[profile?]
	dev-haskell/unordered-containers:=[profile?]
	dev-haskell/utf8-string:=[profile?]
	dev-haskell/vector:=[profile?]
	>=dev-lang/ghc-8.4.3:=
	gpl? ( >=dev-haskell/hscolour-1.21:=[profile?] )
	hsyaml? ( >=dev-haskell/hsyaml-0.2:=[profile?]
			>=dev-haskell/hsyaml-aeson-0.2:=[profile?] )
	!hsyaml? ( >=dev-haskell/yaml-0.5.0:=[profile?] )
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-2.2.0.1
"

SITEFILE="60${PN}-gentoo.el"

src_configure() {
	local threaded_flag=""
	if $(ghc-supports-threaded-runtime); then
		threaded_flag="--flags=threaded"
	else
		threaded_flag="--flags=-threaded"
	fi

	haskell-cabal_src_configure \
		--flag=-ghc-lib \
		$(cabal_flag gpl gpl) \
		$(cabal_flag hsyaml hsyaml) \
		$threaded_flag
}

src_compile() {
	cabal_src_compile

	use emacs && elisp-compile data/hs-lint.el
}

src_install() {
	cabal_src_install

	if use emacs; then
		elisp-install ${PN} data/*.el data/*.elc || die "elisp-install failed."
		elisp-site-file-install "${FILESDIR}/${SITEFILE}"
	fi

	doman data/hlint.1
}

src_test() {
	if use test; then
		export LD_LIBRARY_PATH="${S}/dist/build${LD_LIBRARY_PATH+:}:${LD_LIBRARY_PATH}"
		"${S}"/dist/build/hlint/hlint --datadir="${S}"/data --test || die
	fi
}

pkg_postinst() {
	haskell-cabal_pkg_postinst
	use emacs && elisp-site-regen

	if use test; then
		optfeature_header "Install additional packages for extra test features:"
		optfeature "refactoring tests" "dev-haskell/apply-refact[executable]"
	fi
}

pkg_postrm() {
	haskell-cabal_pkg_postrm
	use emacs && elisp-site-regen
}
