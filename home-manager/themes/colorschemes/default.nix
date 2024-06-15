{ inputs, ... }:
let
  inherit (inputs.nix-colors) colorSchemes;
  in
  {
    imports = [
      inputs.nix-colors.homeManagerModule
    ];
  }
