;;; pkg-doom-modeline.el --- Doom modeline configuration -*- lexical-binding: t; -*-

;;; Commentary:

;; A fancy and fast mode-line inspired by minimalism design.
;; Link: https://github.com/seagle0128/doom-modeline

;;; Code:

(use-package nerd-icons
  :ensure t)

(use-package doom-modeline
  :ensure t
  :after (nerd-icons)
  :init
  (doom-modeline-mode 1)
  :config
  (setq doom-modeline-height 30)
  (setq doom-modeline-persp-name t)
  (setq doom-modeline-persp-icon t)
  (setq doom-modeline-buffer-file-name-style 'relative-from-project)
  (setq doom-modeline-project-detection 'project))

(provide 'pkg-doom-modeline)
;;; pkg-doom-modeline.el ends here
