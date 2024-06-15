# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  nix-colors,
  ...
}:
 {
  # You can import other home-manager modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/home-manager):
    # outputs.homeManagerModules.example

    # You can also split up your configuration and import pieces of it here:
    ./neovim
    ./waybar
    ./firefox.nix
    #./tmux.nix
    nix-colors.homeManagerModules.default
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

  fonts.fontconfig.enable = true;

  home = {
    username = "izzy";
    homeDirectory = "/home/izzy";
  };

  colorScheme = nix-colors.colorSchemes.rose-pine;

  # Add stuff for your user as you see fit:
  programs.vim.enable = true;
  home.packages = with pkgs; [ 

    nerdfonts
    steam 
    obsidian
    discord
    librewolf
    cool-retro-term

    mpv
    font-manager
    playerctl
    swww
    wl-clipboard
    wl-screenrec
    wlsunset
    grim
    slurp
    inputs.hyprland-contrib.packages.x86_64-linux.grimblast
    bemoji
    rofi-wayland
    rofi-emoji
    rofimoji
    rofi-rbw-wayland
    rofi-systemd
    emojipick
    libnotify
    kitty
    eww-wayland
    btop
    bottom
    zathura
    dunst
    lazygit
    unzip
    wget
    rustup
    curl
    sqlite
    cava
    nitch
    wget

    pkgs.llvmPackages_latest.lldb
    pkgs.clang-tools
    pkgs.llvmPackages_latest.clang

    xdg-utils
    xdg-desktop-portal-hyprland
    foot
    wezterm
    cmatrix
    tmatrix
    neo
    lolcat

    noto-fonts
    font-awesome
    fira-code-symbols
    powerline-symbols
    commit-mono
    (nerdfonts.override { fonts = [ "IBMPlexMono" "CascadiaCode" "FiraCode" "FiraMono" "JetBrainsMono" "Ubuntu" ]; })

    deno
  ];

  # Enable home-manager and git
  programs.home-manager.enable = true;
  programs.git.enable = true;
  programs.kitty = {
    enable = true;
    settings = {
      foreground = "#${config.colorScheme.colors.base05}";
      background = "#${config.colorScheme.colors.base00}";
    };
  };
  programs.qutebrowser = {
    enable = true;
    /*
    colors = {
      webpage.preferred_color_scheme = "#${config.colorScheme.kind}";
      tabs.bar.bg = "#${config.colorScheme.colors.base00}";
      tabs.bar.fg = "#${config.colorScheme.colors.base05}";
    };
    */
  };

  programs.zsh = {
    enable = true;

    shellAliases = {
      ll = "ls -l";
      la = "ls -a";
      lh = "ls -lh";
      icat = "kitten icat";
    };
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;
    initExtra = ''
    '';
    zplug = {
      enable = true;
      plugins = [
        { name = "marlonrichert/zsh-autocomplete"; }
      ];
    };
  };
  programs.starship = {
    enable = true;
    settings = pkgs.lib.importTOML ./starship.toml;
  };
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
  programs.helix = {
    enable = true;
  };
  home.file."./.config/hypr/autostart" = {
    text = builtins.readFile(./hyprland/autostart);
    executable = true;
  };
  wayland.windowManager.hyprland = {
	  enable = true;
	  extraConfig = builtins.readFile(./hyprland/hyprland.conf);
	  package = pkgs.hyprland;
	  xwayland.enable = true;
	  systemd.enable = true;

	  plugins = [
	    inputs.hyprgrass.packages.${pkgs.system}.default
	  ];
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.11";
}
