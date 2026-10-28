{ ... }:

{
  programs.tmux = {
    enable = true;
    # Also makes the terminal's native scrollbar work in tmux.
    mouse = true;
    keyMode = "vi";
    terminal = "tmux-256color";
    # Let tmux set the outer terminal's window/tab title.
    extraConfig = ''
      set-option -g set-titles on
      set-option -g set-titles-string "#{session_name} - #{host}"
    '';
  };
}
