{ pkgs, ... }:
let
  treesitterWithGrammars = (pkgs.vimPlugins.nvim-treesitter.withPlugins(p: [
    p.bash
    p.comment
    p.css
    p.dockerfile
    p.fish
    p.gitattributes
    p.gitignore
    p.hcl
    p.go
    p.gomod
    p.gowork
    p.javascript
    p.jq
    p.json5
    p.json
    p.lua
    p.make
    p.markdown
    p.nix
    p.python
    p.rust
    p.toml
    p.typescript
    p.vue
    p.yaml
]));
  in
  {
    home.packages = with pkgs; [
      ripgrep
      fd
      lua-language-server
      rust-analyzer-unwrapped
    ];

    programs.neovim = {
      enable = true;
      defaultEditor = true;
      plugins = [
        treesitterWithGrammars
      ];
    };
    home.file."./.config/nvim/" = {
      source = ./nvim;
      recursive = true;
    };

    home.file."./local/share/nvim/nix/nvim-treesitter/" = {
      recursive = true;
      source = treesitterWithGrammars;
    };
  }
