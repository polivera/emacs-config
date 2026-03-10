;;; pkg-doom-themes.el --- Doom themes configuration -*- lexical-binding: t; -*-

;;; Commentary:

;; An opinionated pack of modern color-themes.
;; Link: https://github.com/doomemacs/themes

;;; Code:

(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-vibrant :no-confirm))

(provide 'pkg-doom-themes)
;;; pkg-doom-themes.el ends here
