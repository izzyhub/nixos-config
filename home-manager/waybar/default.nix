{
  pkgs,
  lib,
  default,
  config,
  ...
}:
with lib default; let
  waybar_config = import ./config.nix {};
  waybar_style = import ./style.nix {inherit config;};
  in {
    home.packages = with pkgs; [python39Packages.requests];
    programs.waybar = {
      enable = true;
      settings = waybar_config;
      style = waybar_style;
    };
  }
