let
  pkgs = import <nixpkgs> { config = {}; overlays = []; };
in
pkgs.mkShell {
  packages = [
    (pkgs.erlang.override { version = "27.0.1"; })
    pkgs.beamPackages.rebar3
  ];
}
