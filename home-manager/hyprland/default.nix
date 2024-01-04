{ 
  inputs,
  pkgs, 
  ... 
}: 
{
imports = [ inputs.hyprland.nixosModules.default ];

home.packages = with pkgs; [
];


}
