{
  description = "FIXME";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
    ocaml-overlays.url = "github:nix-ocaml/nix-overlays";
    ocaml-overlays.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, flake-utils, nixpkgs, ocaml-overlays }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ ocaml-overlays.overlays.default ];
        };
      in with pkgs; rec {
        devShells.default = mkShell {
          inputsFrom = [ packages.default ];
          buildInputs = lib.optional stdenv.isLinux inotify-tools ++ [
            ocamlPackages.merlin
            ocamlformat
            ocamlPackages.ocp-indent
            ocamlPackages.utop
          ];
        };

        packages.default = ocamlPackages.buildDunePackage rec {
          pname = "FIXME";
          version = "0.1.0";
          useDune2 = true;
          src = ./.;
          buildInputs = with ocamlPackages;
            [
              # FIXME: Add dependencies
            ];
          meta = { homepage = "FIXME"; };
        };
      });
}
