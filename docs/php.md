# PHP Development in Emacs

Setup guide assuming you already have the vertico/corfu/consult/orderless stack.

## Prerequisites

Install `intelephense` (the best PHP language server):

```bash
npm install -g intelephense
```

### Activate your licence key

Create the licence file so intelephense picks it up automatically:

```bash
mkdir -p ~/intelephense
echo 'YOUR_LICENCE_KEY_HERE' > ~/intelephense/licence.txt
```

With the premium licence you get extra features: rename across files, go to implementation, smart select, code folding symbols, code actions (add PHPDoc, implement interface methods, import all unresolved), and declaration return types. These all work through eglot with no extra config.

Alternatively, `phpactor` is a fully open-source option with strong refactoring support:

```bash
# Via composer globally
composer global require phpactor/phpactor

# Or download the phar
curl -Lo phpactor.phar https://github.com/phpactor/phpactor/releases/latest/download/phpactor.phar
chmod +x phpactor.phar
sudo mv phpactor.phar /usr/local/bin/phpactor
```

Both work well with eglot. With the premium licence, intelephense covers most refactoring needs (rename, implement interface, import all). Phpactor still has some extras like extract method and generate constructor that intelephense doesn't offer, so it can complement intelephense as a standalone refactoring tool even if you don't use it as your LSP.

## Core Setup

### php-mode + eglot

```elisp
(use-package php-mode
  :ensure t
  :hook (php-mode . eglot-ensure)
  :config
  (setq php-mode-coding-style 'psr2))
```

Eglot auto-detects `intelephense` for `php-mode`. If you're using `phpactor` instead, register it explicitly:

```elisp
(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
               '(php-mode . ("phpactor" "language-server"))))
```

### Intelephense configuration

You can pass workspace settings to intelephense via eglot:

```elisp
(setq-default eglot-workspace-configuration
              '(:intelephense
                (:files (:maxSize 3000000)
                 :environment (:phpVersion "8.3")
                 :format (:enable :json-false))))
```

- **phpVersion** — set this to match your project so diagnostics are accurate.
- **format.enable** — disabled here because you'll likely want to use an external tool (php-cs-fixer or pint) instead.

## Formatting

### PHP-CS-Fixer / Laravel Pint

Use `apheleia` to format on save without blocking Emacs:

```elisp
(use-package apheleia
  :ensure t
  :hook (php-mode . apheleia-mode))
```

Configure the formatter. For php-cs-fixer:

```elisp
(with-eval-after-load 'apheleia
  (setf (alist-get 'php-cs-fixer apheleia-formatters)
        '("php-cs-fixer" "fix" "--using-cache=no" "--no-interaction" "--quiet" filepath))
  (setf (alist-get 'php-mode apheleia-mode-alist)
        'php-cs-fixer))
```

For Laravel Pint (if you work with Laravel):

```elisp
(with-eval-after-load 'apheleia
  (setf (alist-get 'pint apheleia-formatters)
        '("./vendor/bin/pint" "--quiet" filepath))
  (setf (alist-get 'php-mode apheleia-mode-alist)
        'pint))
```

## Useful Packages

### phpactor.el

Even if you use intelephense as your LSP, you can still use phpactor's refactoring commands as a standalone tool:

```elisp
(use-package phpactor
  :ensure t
  :after php-mode
  :bind (:map php-mode-map
         ("C-c r r" . phpactor-context-menu)
         ("C-c r m" . phpactor-extract-method)
         ("C-c r c" . phpactor-generate-constructor)
         ("C-c r i" . phpactor-implement-contracts)))
```

### consult-eglot

Workspace symbol search through consult, same as with Go and Svelte.

```elisp
(use-package consult-eglot
  :ensure t
  :after (consult eglot))
```

### php-ts-mode (Emacs 29+)

Tree-sitter based PHP mode. Better syntax highlighting and structural editing.

```elisp
(use-package treesit-auto
  :ensure t
  :config
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode))
```

Install the grammar:

```elisp
M-x treesit-install-language-grammar RET php RET
```

> **Note:** If you switch to `php-ts-mode`, update your hooks and eglot server programs accordingly:
>
> ```elisp
> (add-to-list 'eglot-server-programs
>              '(php-ts-mode . ("intelephense" "--stdio")))
> (add-hook 'php-ts-mode-hook 'eglot-ensure)
> ```

### emmet-mode

Useful when working with Blade templates or inline HTML:

```elisp
(use-package emmet-mode
  :ensure t
  :hook (web-mode . emmet-mode))
```

### web-mode for Blade templates

`php-mode` doesn't handle `.blade.php` files well. Use `web-mode` for those:

```elisp
(use-package web-mode
  :ensure t
  :mode "\\.blade\\.php\\'"
  :config
  (setq web-mode-markup-indent-offset 4
        web-mode-code-indent-offset 4))
```

## Testing

### phpunit.el

Run PHPUnit tests from within Emacs:

```elisp
(use-package phpunit
  :ensure t
  :after php-mode
  :bind (:map php-mode-map
         ("C-c t t" . phpunit-current-test)
         ("C-c t c" . phpunit-current-class)
         ("C-c t p" . phpunit-current-project)))
```

### pest (if using Pest instead of PHPUnit)

There's no dedicated `pest.el` package, but you can run it via `compile`:

```elisp
(defun php-pest-current-file ()
  "Run Pest on the current test file."
  (interactive)
  (compile (format "./vendor/bin/pest %s" (buffer-file-name))))

(defun php-pest-project ()
  "Run the full Pest suite."
  (interactive)
  (compile "./vendor/bin/pest"))

(with-eval-after-load 'php-mode
  (define-key php-mode-map (kbd "C-c t t") #'php-pest-current-file)
  (define-key php-mode-map (kbd "C-c t p") #'php-pest-project))
```

## Debugging with dape

PHP debugging uses Xdebug + a DAP adapter. Install the adapter:

```bash
npm install -g @vscode/php-debug
```

Make sure Xdebug is installed and configured in your `php.ini`:

```ini
[xdebug]
xdebug.mode = debug
xdebug.start_with_request = yes
xdebug.client_port = 9003
```

Then configure dape:

```elisp
(use-package dape
  :ensure t
  :config
  (add-to-list 'dape-configs
               '(php-xdebug
                 modes (php-mode php-ts-mode)
                 command "node"
                 command-args ("/path/to/vscode-php-debug/out/phpDebug.js")
                 :type "php"
                 :request "launch"
                 :port 9003
                 :pathMappings [(:localSourceRoot "${workspaceFolder}"
                                 :serverSourceRoot "${workspaceFolder}")])))
```

> Adjust the path to `phpDebug.js` based on where npm installed it globally.

## Flymake

Same as with Go and Svelte — eglot activates flymake automatically. Intelephense provides solid diagnostics including undefined variables, type mismatches, missing imports, and deprecated function usage.

For additional static analysis, you can integrate PHPStan or Psalm via flymake:

```elisp
(defun php-phpstan-flymake (report-fn &rest _args)
  "Flymake backend for PHPStan."
  (let ((process (make-process
                  :name "phpstan"
                  :command `("./vendor/bin/phpstan" "analyse"
                             "--error-format=json" "--no-progress"
                             ,(buffer-file-name))
                  :connection-type 'pipe
                  :sentinel (lambda (proc _event)
                              ;; parse JSON output and call report-fn
                              ))))
    process))
```

In practice, most people just run PHPStan/Psalm via a terminal or CI and rely on intelephense for in-editor diagnostics — it catches most issues.

## Minimal Complete Config

```elisp
;; PHP core
(use-package php-mode
  :ensure t
  :hook (php-mode . eglot-ensure)
  :config
  (setq php-mode-coding-style 'psr2))

;; Intelephense settings
(setq-default eglot-workspace-configuration
              '(:intelephense
                (:environment (:phpVersion "8.3")
                 :format (:enable :json-false))))

;; Blade templates
(use-package web-mode
  :ensure t
  :mode "\\.blade\\.php\\'"
  :config
  (setq web-mode-markup-indent-offset 4
        web-mode-code-indent-offset 4))

;; Format on save
(use-package apheleia
  :ensure t
  :hook (php-mode . apheleia-mode))

;; Refactoring
(use-package phpactor
  :ensure t
  :after php-mode
  :bind (:map php-mode-map
         ("C-c r r" . phpactor-context-menu)))

;; Testing
(use-package phpunit
  :ensure t
  :after php-mode
  :bind (:map php-mode-map
         ("C-c t t" . phpunit-current-test)
         ("C-c t c" . phpunit-current-class)
         ("C-c t p" . phpunit-current-project)))

;; Workspace symbols
(use-package consult-eglot
  :ensure t
  :after (consult eglot))

;; Debugging
(use-package dape
  :ensure t)
```
