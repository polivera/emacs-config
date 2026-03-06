# Emacs Configuration v2

Custom Emacs configuration for software development.

## Structure

```
.
├── early-init.el       ; Early initialization (before Emacs loads)
├── custom/
│   └── custom-vars.el  ; Custom constants and variables
└── packages/           ; Package configurations (to be created)
```

## Design Decisions

- **Prefix**: All custom functions and variables use the `xap/` prefix
- **Directories**:
  - `packages/`: Individual package configurations
  - `custom/`: Custom packages and utilities
- **Performance**: Optimized startup with garbage collection tuning and lazy loading
- **Cross-platform**: Supports Linux, macOS, and Windows

## Features

- Startup performance optimizations (gc-cons-threshold, file-name-handler-alist)
- UI customization (disabled scrollbar, toolbar, menubar, tooltips)
- Dark theme by default (#25272f background)
- Font: IosevkaTerm Nerd Font (size varies by OS)

## Usage

Place this configuration in your `~/.emacs.d/` directory and launch Emacs.
