{
  description = "Tiny nix utilities";

  inputs.nixpkgs.url = "nixpkgs/nixos-24.11";

  outputs = {nixpkgs, ...} @ inputs: {
    lib = import ./lib.nix {inherit (inputs.nixpkgs) pkgs;};
  };
}
