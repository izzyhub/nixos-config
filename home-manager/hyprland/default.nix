{ pkgs, ... }:

{
  imports = [
  ];

  home.packages = with pkgs; [
    mpv
    font-manager
    playerctl
    swww
    wl-clipboard
    slurp
    inputs.hyprland-contrib.packages.x86_64-linux.grimblast
    rofi-emoji
    libnotify
  ];

  programs.wofi.enable = true;

  wayland.windowManager.hyprland = {
   enable = true;
   #extraConfig = ''
   # See https://wiki.hyprland.org/Configuration/Monitors
   # See https://wiki.hyprland.org/Configuration/Keyboards
   #'';
  };
}
