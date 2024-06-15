{config}: 
''
  * {
    min-height: 0;
    margin: 0;
    padding: 0;
    padding-bottom: 0;
    font-size: 12pt;
    color: #${config.colorScheme.colors.base05};
    background-color: #${config.colorScheme.colors.base00};
  }
  /*
  #tray {
    border-radius: 8px;
    margin-right: 4px;
  }
  */

  tooltip {
    background: #${config.colorScheme.colors.base03};
    border-radius: 7px;
    border: 2px solid 
  }

  window#waybar {
    background-color: transparent;
    color: #${config.colorScheme.colors.base05};
  }

  #workspaces {
    font-size: 10pt;
    margin-left: 5px;
    color: #${config.colorScheme.colors.base05};
  }
  #workspaces button {
    margin-left: 5px;
    color: #${config.colorScheme.colors.base05};
  }
  #workspaces button.active {
    color: #${config.colorScheme.colors.base06};
  }

  #memory {
    font-size: 10pt;
  }

  #battery {
    padding-left: 10px;
    padding-right: 25px;
    border-radius: 7px;
  }
  #clock {
    margin: 5px;
    padding-left: 10px;
    padding-right: 10px;
    border-radius: 7px;
    color: #${config.colorScheme.colors.base05};
    background-color: #${config.colorScheme.colors.base00};
  }
  #custom-nix {
    font-size: 15pt;
    margin: 5px;
    padding-left: 10px;
    padding-right: 15px;
    border-radius: 7px;
    background-color: #${config.colorScheme.colors.base00};
  }

''
