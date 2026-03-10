# Go Development in Emacs

Setup guide assuming you already have the vertico/corfu/consult/orderless stack.

## Prerequisites

Install `gopls` (the official Go language server):

```bash
go install golang.org/x/tools/gopls@latest
```

Make sure `$GOPATH/bin` (or `$HOME/go/bin`) is in your `$PATH`.

## Core Setup

### go-mode + eglot

`eglot` is built into Emacs 29+ and integrates naturally with corfu (completions via `completion-at-point-functions`) and flymake (diagnostics). No extra glue needed.

```elisp
(use-package go-mode
  :ensure t
  :hook ((go-mode . eglot-ensure)
         (before-save . gofmt-before-save)))
```

### gopls configuration

```elisp
(setq-default eglot-workspace-configuration
              '(:gopls (:staticcheck t
                        :usePlaceholders t
                        :gofmt "goimports")))
```

- **staticcheck** — enables extra static analysis on top of the default `go vet`.
- **usePlaceholders** — fills in function parameter placeholders on completion.
- **goimports** — auto-manages import statements on format (instead of plain `gofmt`).

## Flymake (diagnostics)

Eglot enables flymake automatically when it connects — no extra configuration required. gopls feeds errors and warnings into flymake out of the box.

Optional tweaks:

```elisp
;; Delay before re-checking (seconds). Default is 0.5.
(setq flymake-no-changes-timeout 0.5)

;; Show diagnostics inline next to the code instead of the echo area:
(use-package sideline-flymake
  :ensure t
  :hook (flymake-mode . sideline-mode))
```

## Useful Packages

### consult-eglot

Workspace symbol search through your existing consult filtering.

```elisp
(use-package consult-eglot
  :ensure t
  :after (consult eglot))
```

### gotest.el

Run tests from within Emacs with keybindings for function/file/package level.

```elisp
(use-package gotest
  :ensure t
  :after go-mode
  :bind (:map go-mode-map
         ("C-c t f" . go-test-current-file)
         ("C-c t t" . go-test-current-test)
         ("C-c t p" . go-test-current-project)))
```

### go-tag

Add/remove struct tags (json, db, xml, etc.) without manual editing.

```elisp
(use-package go-tag
  :ensure t
  :after go-mode
  :bind (:map go-mode-map
         ("C-c t a" . go-tag-add)
         ("C-c t r" . go-tag-remove)))
```

### go-gen-test

Generate table-driven test skeletons.

```elisp
(use-package go-gen-test
  :ensure t
  :after go-mode)
```

### Debugging with dape

Minimal debugger UI using Delve (`dlv`). Pairs well with the vertico/corfu ecosystem.

```bash
go install github.com/go-delve/delve/cmd/dlv@latest
```

```elisp
(use-package dape
  :ensure t)
```

## Optional: Tree-sitter (Emacs 29+)

Better syntax highlighting and structural navigation using tree-sitter grammars.

```elisp
(use-package treesit-auto
  :ensure t
  :config
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode))
```

This will use `go-ts-mode` instead of `go-mode` when the tree-sitter grammar is available. You may need to install the grammar first:

```elisp
M-x treesit-install-language-grammar RET go RET
```

> **Note:** If you use `go-ts-mode`, make sure your hooks and keybindings target `go-ts-mode-map` as well, or use a shared hook setup.

## Minimal Complete Config

```elisp
(use-package go-mode
  :ensure t
  :hook ((go-mode . eglot-ensure)
         (before-save . gofmt-before-save)))

(setq-default eglot-workspace-configuration
              '(:gopls (:staticcheck t
                        :usePlaceholders t
                        :gofmt "goimports")))

(use-package consult-eglot
  :ensure t
  :after (consult eglot))

(use-package gotest
  :ensure t
  :after go-mode
  :bind (:map go-mode-map
         ("C-c t f" . go-test-current-file)
         ("C-c t t" . go-test-current-test)
         ("C-c t p" . go-test-current-project)))

(use-package go-tag
  :ensure t
  :after go-mode)

(use-package dape
  :ensure t)
```
