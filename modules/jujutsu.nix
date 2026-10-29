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

      # Newest ancestor of @ that is worth pushing: has changes and a
      # description, so it works both after `jj commit` and mid-change.
      revset-aliases."closest_pushable(to)" = "heads(::to & ~empty() & ~description(exact:\"\"))";

      # Pull the closest bookmark up to the latest pushable change.
      aliases.tug = [
        "bookmark"
        "advance"
        "--to"
        "closest_pushable(@)"
      ];
    };
  };
}
