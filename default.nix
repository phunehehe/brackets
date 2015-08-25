{ mkDerivation, attoparsec, base, stdenv }:
mkDerivation {
  pname = "brackets";
  version = "0.0.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  buildDepends = [ attoparsec base ];
  license = stdenv.lib.licenses.unfree;
}
