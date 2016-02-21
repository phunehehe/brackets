{ mkDerivation, attoparsec, base, stdenv, text }:
mkDerivation {
  pname = "brackets";
  version = "0.0.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [ attoparsec base text ];
  license = stdenv.lib.licenses.unfree;
}
