{ pkgs, ... }:

 let
    flake-compat = builtins.fetchTarball "https://github.com/edolstra/flake-compat/arhives/master.tar.gz";
    hyprland = (import flake-compat {
    src = builtins.fetchTarball "https://github.com/hyprwm/Hyprland/archive/master.tar.gz";
  }).defaultNix;
  in
  imports = [
    inputs.hyprland.homeManagerModules.default
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

  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    bind =
      [
        "$mod, F, exec, firefox"
        ", Print, exec, grimblast copy area"
      ]
    ++ (
      # workspaces
      # binds $mod + [ shift + ] {1..10} to [move to] workspace {1..10}
      builtins.concatLists (builtins.genList (
          x: let
	    ws = let
	      c = (x + 1) / 10;
	   in
	     builtins.toString (x + 1 - (c * 10));
	 in [
	   "$mod, ${ws}, workspace, ${toString (x + 1)}"
	   "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
	 ]
      )
      10)
    );
  };

  wayland.windowManager.hyprland = {
   enable = true;
   #extraConfig = ''
   # See https://wiki.hyprland.org/Configuration/Monitors
   # See https://wiki.hyprland.org/Configuration/Keyboards
   #'';
  };
}
