#!/usr/bin/env bash
set -efuo pipefail

PATH=$(nix-build --no-out-link '<nixpkgs>' --attr cabal-install)/bin:$PATH

nix-channel --update
nix-shell --run 'cabal configure --enable-tests'
cabal build
