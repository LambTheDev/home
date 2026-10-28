# Tools every machine gets, configured identically. Host-specific settings
# (identity, username, stateVersion, extra tools) belong in the consumer.
{ inputs }:
{ pkgs, ... }:

{
  imports = [
    ./cli.nix
    ./git.nix
    ./jujutsu.nix
    ./neovim.nix
    ./tmux.nix
    ./zsh.nix
  ];

  _module.args.unstable = inputs.unstable.legacyPackages.${pkgs.stdenv.hostPlatform.system};

  programs.home-manager.enable = true;
}
