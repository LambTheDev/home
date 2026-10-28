{ pkgs, unstable, ... }:

{
  home.packages = [
    pkgs.dig
    pkgs.htop
    pkgs.jq
    pkgs.ncdu
    pkgs.pv
    pkgs.ripgrep
    pkgs.tree
    unstable.hunk
  ];

  programs.bat.enable = true;
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
  programs.fzf.enable = true;
  programs.yazi = {
    enable = true;
    settings.preview.wrap = "yes";
  };
}
