{
  description = "Tiny nix utilities";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.11";
  };
  outputs = {
    self,
    nixpkgs,
  }: let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in {
    lib = import ./lib.nix {inherit pkgs;};
  };
}
