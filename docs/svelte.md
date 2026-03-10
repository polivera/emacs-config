# Svelte Development in Emacs

Setup guide assuming you already have the vertico/corfu/consult/orderless stack.

## Prerequisites

Install the Svelte language server:

```bash
npm install -g svelte-language-server typescript-svelte-plugin
```

Also make sure you have `typescript` and `typescript-language-server` available if you work with TypeScript in your Svelte components:

```bash
npm install -g typescript typescript-language-server
```

## Core Setup

### web-mode + eglot

Emacs doesn't have a dedicated `svelte-mode` in MELPA that's well maintained. The standard approach is to use `web-mode` and associate it with `.svelte` files, then connect eglot to the Svelte language server.

```elisp
(use-package web-mode
  :ensure t
  :mode "\\.svelte\\'"
  :config
  (setq web-mode-markup-indent-offset 2
        web-mode-css-indent-offset 2
        web-mode-code-indent-offset 2
        web-mode-script-padding 2
        web-mode-style-padding 2))
```

### Eglot configuration for Svelte

Eglot needs to know which language server to use for `.svelte` files opened in `web-mode`:

```elisp
(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
               '(web-mode . ("svelteserver" "--stdio"))))
```

Then enable eglot for web-mode buffers that are Svelte files:

```elisp
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-suffix-p ".svelte" (buffer-file-name))
              (eglot-ensure))))
```

This way eglot only starts the Svelte LSP for `.svelte` files, not for every `.html` or `.php` file that also uses web-mode.

## Formatting

### Prettier

Svelte projects typically use Prettier with `prettier-plugin-svelte`. Install them in your project:

```bash
npm install -D prettier prettier-plugin-svelte
```

Then use `apheleia` to run Prettier on save without blocking Emacs:

```elisp
(use-package apheleia
  :ensure t
  :hook (web-mode . apheleia-mode))
```

Apheleia detects Prettier automatically from your project's config. If you need to be explicit:

```elisp
(with-eval-after-load 'apheleia
  (setf (alist-get 'prettier apheleia-formatters)
        '("npx" "prettier" "--stdin-filepath" filepath)))
```

## Useful Packages

### emmet-mode

Fast HTML expansion inside Svelte templates. Type `div.container>ul>li*3` and expand.

```elisp
(use-package emmet-mode
  :ensure t
  :hook (web-mode . emmet-mode))
```

### consult-eglot

Same as with Go — workspace symbol search through consult.

```elisp
(use-package consult-eglot
  :ensure t
  :after (consult eglot))
```

### rainbow-mode

Shows CSS color values with their actual color as background. Handy when working with styles in Svelte components.

```elisp
(use-package rainbow-mode
  :ensure t
  :hook (web-mode . rainbow-mode))
```

### eldoc-box

Nicer rendering of hover documentation from the Svelte LSP, shown in a popup frame instead of the echo area.

```elisp
(use-package eldoc-box
  :ensure t
  :hook (eglot-managed-mode . eldoc-box-hover-at-point-mode))
```

## Tailwind CSS Support

If you're using Tailwind (common in Svelte projects), you can get class name completions via the Tailwind LSP. Install it:

```bash
npm install -g @tailwindcss/language-server
```

The tricky part is that eglot only supports one language server per major mode. Two options:

### Option A: Use lsp-mode instead of eglot

`lsp-mode` supports multiple servers per buffer. If Tailwind completions matter a lot to you, this may be worth the switch.

### Option B: Use `cape` to merge completions

Keep eglot with the Svelte LSP, and add Tailwind completions via a separate completion source using `cape-company-to-capf` or a custom cape backend. This is more hacky but keeps you in eglot land.

### Option C: Rely on Tailwind IntelliSense via your browser devtools

Skip editor-level Tailwind completions and rely on the Svelte LSP + your knowledge of Tailwind classes. Many people work this way just fine.

## Flymake (diagnostics)

Just like with Go, eglot enables flymake automatically. The Svelte language server provides TypeScript/JavaScript diagnostics, template errors, accessibility warnings, and CSS issues — all piped through flymake with no extra setup.

Optional inline diagnostics:

```elisp
(use-package sideline-flymake
  :ensure t
  :hook (flymake-mode . sideline-mode))
```

## Tree-sitter

There are tree-sitter grammars for the sub-languages (HTML, CSS, JS/TS) but no widely adopted `svelte-ts-mode` yet. Stick with `web-mode` for now — it handles Svelte's mixed-language files well enough.

## Minimal Complete Config

```elisp
;; Svelte via web-mode
(use-package web-mode
  :ensure t
  :mode "\\.svelte\\'"
  :config
  (setq web-mode-markup-indent-offset 2
        web-mode-css-indent-offset 2
        web-mode-code-indent-offset 2
        web-mode-script-padding 2
        web-mode-style-padding 2))

;; Eglot with Svelte language server
(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
               '(web-mode . ("svelteserver" "--stdio"))))

(add-hook 'web-mode-hook
          (lambda ()
            (when (string-suffix-p ".svelte" (buffer-file-name))
              (eglot-ensure))))

;; Format on save with Prettier
(use-package apheleia
  :ensure t
  :hook (web-mode . apheleia-mode))

;; HTML expansion
(use-package emmet-mode
  :ensure t
  :hook (web-mode . emmet-mode))

;; Workspace symbols via consult
(use-package consult-eglot
  :ensure t
  :after (consult eglot))
```
