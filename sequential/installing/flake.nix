{
  description = "A flake to download Erlang 27 and Rebar3 from Nixpkgs 24.05";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/24.05"; # Pinning to Nixpkgs version 24.05
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        packages.default = pkgs.mkShell {
          buildInputs = [
            pkgs.erlang_27    # Erlang 27
            pkgs.rebar3       # Rebar3
          ];
        };
      });
}

