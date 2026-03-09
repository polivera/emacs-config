;;; pkg-corfu.el --- Corfu completion at point -*- lexical-binding: t; -*-

(use-package corfu
  :ensure t
  :init
  (global-corfu-mode)
  :config
  (setq corfu-auto t)
  (setq corfu-auto-delay 0.2)
  (setq corfu-auto-prefix 2)
  (setq corfu-cycle t)
  (setq corfu-preselect 'prompt)
  :general
  (:keymaps 'corfu-map
    "C-j" #'corfu-next
    "C-k" #'corfu-previous
    "C-l" #'corfu-insert
    "<escape>" #'corfu-quit))

(provide 'pkg-corfu)

;;; pkg-corfu.el ends here
