# No user here: each machine sets its own identity.
{ ... }:

{
  programs.git = {
    enable = true;
    settings = {
      alias = {
        # Simpler commit log
        l = "log --pretty=oneline -n 20 --graph --abbrev-commit";
        # Short status
        s = "status -s";
        # Longer status
        ss = "status";
        # Clone a repository with all submodules
        c = "clone --recursive";
        # Amend with same message
        amend = "commit --amend --no-edit";
        # Fast-forward only merge
        ff = "merge --ff-only";
      };
      apply.whitespace = "fix";
      branch.sort = "-committerdate";
      column.ui = "auto";
      commit.verbose = true;
      core.autocrlf = false;
      diff = {
        algorithm = "histogram";
        colorMoved = "plain";
        mnemonicPrefix = true;
        renames = true;
      };
      fetch = {
        prune = true;
        pruneTags = true;
        all = true;
      };
      init.defaultBranch = "main";
      log.date = "iso";
      merge = {
        conflictstyle = "zdiff3";
        tool = "nvim";
      };
      pull.ff = "only";
      push = {
        autoSetupRemote = true;
        followTags = true;
      };
      rerere = {
        enabled = true;
        autoupdate = true;
      };
      rebase = {
        autoSquash = true;
        autoStash = true;
        updateRefs = true;
      };
      tag.sort = "version:refname";
    };
  };
}
