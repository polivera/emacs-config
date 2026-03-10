;;; pkg-modus-themes.el --- Modus themes configuration -*- lexical-binding: t; -*-

;;; Commentary:

;; Highly accessible themes conforming to WCAG AAA contrast standards.
;; Built into Emacs 28+, but we use the package for latest features.
;; Link: https://protesilaos.com/emacs/modus-themes

;;; Code:

(use-package modus-themes
  :ensure t
  :config
  (load-theme 'modus-vivendi :no-confirm))

(provide 'pkg-modus-themes)
;;; pkg-modus-themes.el ends here
