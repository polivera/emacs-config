# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal Emacs configuration for software development. Uses Elpaca as the package manager with a modular file structure.

## Usage

Place this repo contents in `~/.emacs.d/` and launch Emacs. On first run, Elpaca bootstraps itself from GitHub and installs configured packages into `autogen/elpaca/`.

## Architecture

### Load Order

1. `early-init.el` — runs before Emacs UI loads; sets up load paths, GC tuning, and disables UI elements
2. `init.el` — loads modules in order: `elpaca` → `custom-vars` → `sort-autogen` → `use-base-config`

### Directory Structure

- `custom/` — user configuration modules
- `packages/` — package manager bootstrap (`elpaca.el`) and future package configs
- `autogen/` — git-ignored; all generated files (elpaca builds, native compilation cache, auto-saves, etc.)

### Key Files

- `early-init.el` — startup perf optimizations, pre-UI config (background color, disabled UI elements)
- `custom/custom-vars.el` — constants with `xap/` prefix: OS detection, font settings, paths
- `custom/sort-autogen.el` — redirects all generated files to `autogen/`; enables built-in modes
- `custom/use-base-config.el` — font loading, macOS keybindings, zoom keybindings
- `packages/elpaca.el` — Elpaca package manager bootstrap (v0.11)

### Conventions

- **Prefix**: All custom functions and variables use the `xap/` prefix
- **`use-package`**: Used with `:ensure nil` for built-ins; Elpaca provides `:ensure t` support for external packages
- **Cross-platform**: OS detection via `xap/const/is-linux`, `xap/const/is-macos`, `xap/const/is-window`
- **Font**: IosevkaTerm Nerd Font — 145px on macOS, 125px on Linux
- **Theme colors**: Background `#25272f`, foreground `#B3B9C4`

## Adding New Packages

Add new package configuration files to `packages/` and load them from `init.el` using `(require 'package-name)`.
