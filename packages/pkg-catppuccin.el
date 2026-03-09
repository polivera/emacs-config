;;; pkg-catppuccin.el --- Catppuccin theme configuration -*- lexical-binding: t; -*-

;;; Commentary:

;; Soothing pastel theme for Emacs.
;; Link: https://github.com/catppuccin/emacs

;;; Code:

(use-package catppuccin-theme
  :ensure t
  :config
  (setq catppuccin-flavor 'mocha)
  (load-theme 'catppuccin :no-confirm))

(provide 'pkg-catppuccin)
;;; pkg-catppuccin.el ends here
