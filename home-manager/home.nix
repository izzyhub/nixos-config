# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
 {
  # You can import other home-manager modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/home-manager):
    # outputs.homeManagerModules.example

    # Or modules exported from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModules.default

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
    #./hyprland
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = _: true;
      permittedInsecurePackages = [
        "electron-25.9.0"
      ];
    };
  };

  # TODO: Set your username
  home = {
    username = "izzy";
    homeDirectory = "/home/izzy";
  };

  # Add stuff for your user as you see fit:
  programs.vim.enable = true;
  programs.neovim.enable = true;
  home.packages = with pkgs; [ 
    steam 
    firefox
    obsidian

    mpv
    font-manager
    playerctl
    swww
    wl-clipboard
    slurp
    inputs.hyprland-contrib.packages.x86_64-linux.grimblast
    rofi-emoji
    libnotify
    kitty
  ];

  # Enable home-manager and git
  programs.home-manager.enable = true;
  programs.git.enable = true;
  programs.kitty.enable = true;

  programs.wofi.enable = true;
  wayland.windowManager.hyprland = {
	  enable = true;
	  extraConfig = ''
          # See https://wiki.hyprland.org/Configuration/Monitors
          # See https://wiki.hyprland.org/Configuration/Keyboards
	  bind = SUPER, Return, exec, kitty
	  '';
	  package = pkgs.hyprland;
	  xwayland.enable = true;

	  systemd.enable = true;
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.11";

}
