{
  description = "A Nix library for rendering Mustache templates";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
  }: let
    pkgs = import nixpkgs {system = "x86_64-linux";};
    mustache = pkgs.mustache-go; # Or use mustache-rs
  in {
    lib.renderMustache = {
      template,
      data,
    }:
      pkgs.runCommand "rendered-template" {buildInputs = [mustache];} ''
        echo '${builtins.toJSON data}' | ${mustache}/bin/mustache - ${template} > $out
      '';
  };
}
