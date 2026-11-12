{ ... }:

{
  programs.tmux = {
    enable = true;
    # Also makes the terminal's native scrollbar work in tmux.
    mouse = true;
    keyMode = "vi";
    terminal = "tmux-256color";
    # Let tmux set the outer terminal's window/tab title: the title the active
    # pane's app set (e.g. Claude Code, nvim), else the pane's directory name.
    # A pane's title defaults to the hostname until an app sets one.
    extraConfig = ''
      set-option -g set-titles on
      set-option -g set-titles-string "#{?#{==:#{pane_title},#{host}},#{b:pane_current_path},#{pane_title}}"
    '';
  };
}
