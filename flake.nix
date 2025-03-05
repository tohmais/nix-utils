{
  description = "A Nix library for rendering Mustache templates";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.11";
  };

  outputs = {
    self,
    nixpkgs,
  }: let
    pkgs = import nixpkgs {system = "x86_64-linux";};
    mustache = pkgs.mustache-go; # You can switch to mustache-rs if preferred.
  in {
    lib = {
      renderMustache = args: let
        dataJSON = builtins.toJSON args.data;
      in
        pkgs.runCommand "rendered-template" {
          buildInputs = [mustache];
        } ''
          echo "${dataJSON}" | ${mustache}/bin/mustache - ${args.template} > $out
        '';

      renderInline = args: let
        dataJSON = builtins.toJSON args.data;
      in
        pkgs.runCommand "inline-template" {
          buildInputs = [mustache];
        } ''
          echo "${dataJSON}" | ${mustache}/bin/mustache - <(echo "${args.template}") > $out
        '';
    };
  };
}
