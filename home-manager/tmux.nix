{ pkgs, ... }: {
  programs.tmux = {
    enable = true;
    clock24 = true;
    baseIndex = 1;
    terminal = "xterm-256color";
    escapeTime = 500;
    keyMode = "vi";
    prefix = "C-Z";
    mouse = true;
    
  };
}
