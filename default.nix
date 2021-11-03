{ pkgs ? import <nixpkgs> {} }:
  pkgs.mkShell {
    # nativeBuildInputs is usually what you want -- tools you need to run
    nativeBuildInputs = [
      pkgs.ghc
      pkgs.cabal-install
      pkgs.cabal2nix
      pkgs.python38];
}
