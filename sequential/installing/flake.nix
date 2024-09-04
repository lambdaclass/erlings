{
  description = "A flake to download Erlang 27 and Rebar3 from Nixpkgs 24.05";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/24.05";
    flake-utils.url = "github:numtide/flake-utils/main";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        packages.default = pkgs.mkShell {
          buildInputs = [
            pkgs.erlang_27    
            pkgs.rebar3       
          ];
        };
      });
}

