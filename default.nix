{ mkDerivation, attoparsec, stdenv }:
mkDerivation {
  pname = "brackets";
  version = "0.0.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  buildDepends = [ attoparsec ];
  license = stdenv.lib.licenses.unfree;
}
