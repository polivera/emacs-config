;;; pkg-evil.el --- Evil mode configuration -*- lexical-binding: t; -*-

(use-package evil
  :ensure t
  :demand t
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-undo-system 'undo-redo)
  :config
  (evil-mode 1)

  ;; Use C-g to return to normal state (consistent with Emacs)
  (evil-define-key '(insert visual replace) 'global
    (kbd "C-g") #'evil-normal-state)

  ;; d/D delete without kill ring (black hole register)
  (evil-define-operator xap/evil-delete (beg end &optional type _register yank-handler)
    "Delete without adding to kill ring."
    (evil-delete beg end type ?_ yank-handler))

  (evil-define-operator xap/evil-delete-line (beg end &optional type _register yank-handler)
    "Delete to end of line without adding to kill ring."
    (evil-delete-line beg end type ?_ yank-handler))

  ;; d/D = delete (no kill ring), m/M = delete with kill ring
  (evil-define-key '(normal visual) 'global
    "d" #'xap/evil-delete
    "D" #'xap/evil-delete-line
    "m" #'evil-delete
    "M" #'evil-delete-line))

(use-package evil-collection
  :ensure t
  :after evil
  :config
  (evil-collection-init))

(provide 'pkg-evil)

;;; pkg-evil.el ends here
