;;; pkg-general.el --- General package configuration -*- lexical-binding: t; -*-

;;; Commentary:

;; general.el provides a more convenient method for binding keys in emacs (for both evil and non-evil users).
;; Link: https://github.com/noctuid/general.el

;;; Code:

(use-package general
  :ensure t
  :demand t
  :config
  (general-create-definer xap/leader-key
    :prefix "C-a"
    :keymaps 'override)
  (general-create-definer xap/quick-leader
    :prefix "C-s"
    :keymaps 'override)

  ;; Define some keys
  (xap/quick-leader
    "n" 'find-file
    "h" 'next-buffer
    "l" 'previous-buffer
    "s" 'save-buffer
    "q" 'revert-buffer
    "/" 'comment-or-uncomment-region)
)


(provide 'pkg-general)
;;; pkg-general.el ends here
