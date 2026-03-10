;;; pkg-ef-themes.el --- Ef themes configuration -*- lexical-binding: t; -*-

;;; Commentary:

;; Colorful and well-crafted themes by Protesilaos Stavrou.
;; Link: https://protesilaos.com/emacs/ef-themes

;;; Code:

(use-package ef-themes
  :ensure t
  :config
  (load-theme 'ef-dark :no-confirm))

(provide 'pkg-ef-themes)
;;; pkg-ef-themes.el ends here
