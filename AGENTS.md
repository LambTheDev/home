# Repository Guidelines

## Purpose

Home Manager modules shared by all of LambTheDev's machines: the same basic tools, configured to behave identically everywhere. Anything only one machine needs (identity, username, `home.stateVersion`, work or desktop tools) belongs in that machine's own flake, which imports `homeManagerModules.default` from here.

## Project Structure

`flake.nix` pins `nixpkgs` (stable release), `home-manager` (matching release) and `unstable`. Consumers make their inputs follow these, so release migrations happen once for every machine. `modules/default.nix` imports one module per tool and provides `unstable` as a module argument. Native config files live under `config/<application>/`, for example the Neovim Lua tree in `config/nvim/lua/lamb/`.

Modules are plain config with no options. Add an option only when a tool genuinely needs to be opt-in.

## Validation

- `nix flake check` builds a minimal home for the current system.
- `nix eval .#checks.x86_64-linux.home.drvPath` evaluates the Linux one from a Mac.

Keep `flake.lock` synchronized when changing inputs and review lock-file diffs before committing upgrades.

## Coding Style

Two-space indentation in Nix files, formatted with `nixfmt`. Name modules after the tool they configure (`tmux.nix`). Match the native format of files under `config/`.

## Commits

Short, lowercase, imperative summaries such as `add tmux module`, authored as `LambTheDev <8612454+LambTheDev@users.noreply.github.com>`. Keep each commit focused.
