{ lib, nix-gitignore, buildDunePackage, base, ppx_jane }:

buildDunePackage rec {
  pname = "FIXME";
  version = "0.1.0";
  useDune2 = true;
  src = nix-gitignore.gitignoreFilterSource lib.cleanSourceFilter [ ] ./.;
  checkInputs = [ ];
  propagatedBuildInputs = [ base ppx_jane ];
  passthru.checkInputs = checkInputs;

  meta = { homepage = "FIXME"; };
}
