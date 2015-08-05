{ nixpkgs ? import <nixpkgs> {}, compiler ? "ghc7101" }:

let

  inherit (nixpkgs) pkgs;

  f = { mkDerivation, attoparsec, stdenv }:
      mkDerivation {
        pname = "brackets";
        version = "0.0.0";
        src = ./.;
        isLibrary = false;
        isExecutable = true;
        buildDepends = [ attoparsec ];
        license = stdenv.lib.licenses.unfree;
      };

  drv = pkgs.haskell.packages.${compiler}.callPackage f {};

in

  if pkgs.lib.inNixShell then drv.env else drv
