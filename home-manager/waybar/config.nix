_: {
  mainBar = {
    position = "top";
    layer = "top";
    height = 12;
    margin-top = 0;
    margin-bottom = 0;
    margin-left = 0;
    margin-right = 0;
    modules-left = [
      "custom/nix"
      "hyprland/workspaces"
    ];

    modules-center = [
    ];

    modules-right = [
      #"disk"
      "memory"
      #"network"
      "clock"
      "battery"
    ];

    network = {
      format = "{ifname}";
      format-wifi = "{essid} ";
      tooltip-format-wifi = "{ipaddr}/{cidr} {essid} ({signalStrength}%) ";
    };

    memory = {
      format = "{used:0.1f}G/{total:0.1f}G ";
      on-click = "kitty btm";
      tooltip = true;
      tooltip-format = "{percentage}%";
    };
    "custom/nix" = {
      format = " ";
      tooltip = false;
      on-click = "rofi -show drun";
    };

    battery = {
      states = {
        good = 100;
	warning = 30;
	critical = 10;
      };
      format = "{capacity}% {icon}";
      format-icons = ["" "" "" "" ""];
    };
    clock = {
      format = "󱑍 {:%I:%M %p}";
      tooltip = false;
      tooltip-format = ''
        <big>{:%Y %B}</big>
	<tt><small>{calendar}</small></tt>
      '';
      format-alt = " {:%d/%m}";
    };

    "hyprland/workspaces" = {
      active-only = false;
      all-outputs = true;
      disable-scroll = false;
      on-scroll-up = "hyprctl dispatch workspace e-1";
      on-scroll-down = "hyprctl dispatch workspace e+1";
      on-click = "activate";
      show-special = "false";
      sort-by-number = true;
      format = "{name} {icon}";
      format-icons = {
        active = "";
        default = "";
      };
      persistent_workspaces = {

      };
    };
    "hyprland/window" = {
      format = "{}";        
      rewrite = {
        "(.*) — Mozilla Firefox"= "🌎 $1";
      };
    };

    disk = {
      format = " {percentage_used}% ({free})";
      tooltip = true;
    };
  };
}
