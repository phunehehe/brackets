{ pkgs ? import <nixpkgs> {} }:
let drv = pkgs.callPackage ./nix2cabal {
  spec = {
    name = "brackets";
    license = "MPL-2.0";
    executables.brackets.main = "Main.hs";
    ghc-options = "-Wall";
    dependencies = [
      "attoparsec"
      "base"
      "text"
    ];
  };
};
in if pkgs.lib.inNixShell then drv.env else drv
