;;; pkg-which-key.el --- Which Key keybinding hints -*- lexical-binding: t; -*-

(use-package which-key
  :ensure t
  :demand t
  :after (general)
  :general
  (xap/leader-key
    "?" 'which-key-show-top-level)
  :init
  (setq which-key-separator " ")
  (setq which-key-prefix-prefix "+")
  :config
  (which-key-mode))

(provide 'pkg-which-key)

;;; pkg-which-key.el ends here
