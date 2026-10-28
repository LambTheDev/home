# No user here: each machine sets its own identity.
{ unstable, ... }:

{
  programs.jujutsu = {
    enable = true;
    package = unstable.jujutsu;
    settings = {
      # Track every bookmark so a fetch deletes it once the remote branch is
      # gone. local/* is for bookmarks that must never be pushed.
      remotes.origin.auto-track-bookmarks = "* ~ local/*";
    };
  };
}
