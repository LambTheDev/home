{ ... }:

{
  home.shell.enableZshIntegration = true;
  home.sessionVariables.PAGER = "less --quit-if-one-screen";

  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
    };
    shellAliases = {
      ll = "ls -lah";
      l = "ls -lh";
    };
  };
}
