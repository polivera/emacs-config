;;; pkg-magit.el --- Magit configuration -*- lexical-binding: t; -*-

;;; Commentary:

;; Magit is a complete text-based user interface to Git.
;; Link: https://magit.vc

;;; Code:

(use-package transient
  :ensure t)

(use-package magit
  :ensure t
  :after general
  :config
  (xap/quick-leader
    "g" 'magit-status)
  (xap/leader-key
    "g"   '(nil :which-key "Magit")
    "g s" '(magit-status :which-key "Status")
    "g f" '(magit-file-dispatch :which-key "File")
    "g l" '(magit-log :which-key "Log"))
  (setq magit-log-arguments '("--graph" "--decorate" "--color"))
  (setq magit-define-global-key-bindings nil))

(use-package diff-hl
  :ensure t
  :after (magit)
  :defer t
  :init
  (add-hook 'magit-pre-refresh-hook 'diff-hl-magit-pre-refresh)
  (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)
  (global-diff-hl-mode))


(provide 'pkg-magit)
;;; pkg-magit.el ends here.
