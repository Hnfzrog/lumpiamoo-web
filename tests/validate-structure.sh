#!/usr/bin/env bash
# Structural validation for the LumpiaMoo static site.
# Each check maps to an Acceptance Criterion (AC-*) in
# docs/project-docs/foundation/prd.md
#
# Usage:  bash tests/validate-structure.sh
# Exit:   0 = all checks passed, 1 = one or more failed

set -u

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
HTML="$ROOT/index.html"
CSS="$ROOT/assets/css/style.css"
LOGO="$ROOT/assets/svg/logo.svg"

P=0
F=0
pass() { printf '  \033[32mPASS\033[0m  %s\n' "$1"; P=$((P + 1)); }
fail() { printf '  \033[31mFAIL\033[0m  %s\n' "$1"; F=$((F + 1)); }
chk() { local d="$1"; shift; if "$@" >/dev/null 2>&1; then pass "$d"; else fail "$d"; fi; }

# helpers ---------------------------------------------------------------
has() { grep -qi -- "$1" "$2"; }
lacks() { ! grep -qi -- "$1" "$2"; }
count_at_least() { [ "$(grep -o -- "$1" "$2" | wc -l | tr -d ' ')" -ge "$3" ]; }
referenced_at_least() { [ "$(grep -o -- "$1" "$2" | wc -l | tr -d ' ')" -ge "$3" ]; }

imgs_exist() {
  local src
  for src in $(grep -o 'assets/img/[A-Za-z0-9._-]*' "$HTML" | sort -u); do
    [ -f "$ROOT/$src" ] || return 1
  done
  return 0
}

sections_in_order() {
  local prev=0 id ln
  for id in hero tentang produk keunggulan kontak footer; do
    ln=$(grep -n "id=\"$id\"" "$HTML" | head -1 | cut -d: -f1)
    [ -z "$ln" ] && return 1
    [ "$ln" -lt "$prev" ] && return 1
    prev=$ln
  done
  return 0
}

printf '\n== LumpiaMoo structural validation ==\n\n'

# AC-1 : single page with all six sections, in order
chk "AC-1 index.html exists"                 test -f "$HTML"
chk "AC-1 #hero present"                     has 'id="hero"' "$HTML"
chk "AC-1 #tentang present"                  has 'id="tentang"' "$HTML"
chk "AC-1 #produk present"                   has 'id="produk"' "$HTML"
chk "AC-1 #keunggulan present"               has 'id="keunggulan"' "$HTML"
chk "AC-1 #kontak present"                   has 'id="kontak"' "$HTML"
chk "AC-1 #footer present"                   has 'id="footer"' "$HTML"
chk "AC-1 sections appear in order"          sections_in_order

# AC-2 : every variant card shows name, contents, price
chk "AC-2 variant cards present"             has 'class="variant' "$HTML"
chk "AC-2 >= 4 variants rendered"            count_at_least 'class="variant"' "$HTML" 4
chk "AC-2 prices shown (>= 4)"               count_at_least 'Rp' "$HTML" 4

# AC-3 : brand palette tokens defined and used
chk "AC-3 stylesheet exists"                 test -f "$CSS"
chk "AC-3 token --color-chili"               has '#C0392B' "$CSS"
chk "AC-3 token --color-golden"              has '#E8A33D' "$CSS"
chk "AC-3 token --color-cocoa"               has '#6B3E26' "$CSS"
chk "AC-3 token --color-cream"               has '#FFF8F0' "$CSS"
chk "AC-3 token --color-scallion"            has '#4E7A3A' "$CSS"

# AC-4 : responsive / mobile-first
chk "AC-4 viewport meta present"             has 'name="viewport"' "$HTML"
chk "AC-4 media queries present"             has '@media' "$CSS"

# AC-5 : no ordering, no form, no backend call
chk "AC-5 no <form> element"                 lacks '<form' "$HTML"
chk "AC-5 no <button> element"               lacks '<button' "$HTML"
chk "AC-5 no fetch/XHR call"                 lacks 'fetch(' "$HTML"

# AC-6 : SVG logo in header/footer + favicon
chk "AC-6 logo.svg exists"                   test -f "$LOGO"
chk "AC-6 favicon = logo.svg"                has 'rel="icon"' "$HTML"
chk "AC-6 logo referenced >= 2 times"        referenced_at_least 'logo.svg' "$HTML" 2

# AC-7 : contact info shown as text only
chk "AC-7 address deferred (no addr card)"   lacks 'contact__label">Alamat' "$HTML"
chk "AC-7 opening hours shown"               has 'Jam' "$HTML"
chk "AC-7 Instagram shown"                   has 'Instagram' "$HTML"
chk "AC-7 WhatsApp shown"                    has 'WhatsApp' "$HTML"

# AC-8 : real (raster) photos load from assets/img/
chk "AC-8 images from assets/img/"           has 'assets/img/' "$HTML"
chk "AC-8 >= 6 raster photos referenced"     count_at_least 'assets/img/[A-Za-z0-9._-]*\.jpg' "$HTML" 6
chk "AC-8 no vector placeholders in img/"    lacks 'assets/img/[A-Za-z0-9._-]*\.svg' "$HTML"
chk "AC-8 every referenced image exists"     imgs_exist

printf '\n== Result: %d passed, %d failed ==\n\n' "$P" "$F"
[ "$F" -eq 0 ] || exit 1
