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
  (evil-define-operator xap/evil-delete (beg end type register yank-handler)
    "Delete without adding to kill ring."
    (interactive "<R><x><y>")
    (evil-delete beg end type ?_ yank-handler))

  (evil-define-operator xap/evil-delete-line (beg end type register yank-handler)
    "Delete to end of line without adding to kill ring."
    :motion evil-end-of-line-or-visual-line
    (interactive "<R><x><y>")
    (evil-delete-line beg end type ?_ yank-handler))

  ;; c/C change without kill ring (black hole register)
  (evil-define-operator xap/evil-change (beg end type register yank-handler)
    "Change without adding to kill ring."
    (interactive "<R><x><y>")
    (evil-change beg end type ?_ yank-handler))

  (evil-define-operator xap/evil-change-line (beg end type register yank-handler)
    "Change to end of line without adding to kill ring."
    :motion evil-end-of-line-or-visual-line
    (interactive "<R><x><y>")
    (evil-change-line beg end type ?_ yank-handler))

  ;; d/D = delete (no kill ring), c/C = change (no kill ring)
  ;; m/M = delete with kill ring
  (evil-define-key '(normal visual) 'global
    "d" #'xap/evil-delete
    "D" #'xap/evil-delete-line
    "c" #'xap/evil-change
    "C" #'xap/evil-change-line
    "m" #'evil-delete
    "M" #'evil-delete-line)

  ;; Unbind RET in motion state
  (define-key evil-motion-state-map (kbd "RET") nil)

  ;; Case conversion
  (evil-define-key 'normal 'global
    "tu" #'evil-upcase
    "tl" #'evil-downcase))

(use-package evil-collection
  :ensure t
  :after evil
  :config
  (evil-collection-init))

(provide 'pkg-evil)

;;; pkg-evil.el ends here
