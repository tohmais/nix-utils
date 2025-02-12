{
  description = "Tiny nix utilities";

  inputs.nixpkgs.url = "nixpkgs/nixos-24.11";

  outputs = {
    self,
    nixpkgs,
  }: let
    forAllSystems = nixpkgs.lib.genAttrs ["x86_64-linux" "x86_64-darwin" "i686-linux" "aarch64-linux"];
    pkgs = forAllSystems (system: nixpkgs.legacyPackages.${system});
  in {
    lib = import ./lib.nix {inherit pkgs;};
  };
}
