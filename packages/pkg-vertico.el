;;; pkg-vertico.el --- Vertico completion UI -*- lexical-binding: t; -*-

;; Enable Vertico.
(use-package vertico
  :ensure t
  :defer t
  :general
  (:keymaps 'vertico-map
    "C-j" #'vertico-next
    "C-k" #'vertico-previous)
  :init
  (vertico-mode))


;; Savehist
(use-package savehist
  :ensure nil
  :init
  (savehist-mode))

(provide 'pkg-vertico)

;;; pkg-vertico.el ends here
