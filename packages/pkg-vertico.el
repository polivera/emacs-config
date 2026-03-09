;;; pkg-vertico.el --- Vertico completion UI -*- lexical-binding: t; -*-

;; Enable Vertico.
(use-package vertico
  :ensure t
  :defer t
  :init
  (vertico-mode))


;; Savehist
(use-package savehist
  :ensure nil
  :init
  (savehist-mode))

(provide 'pkg-vertico)

;;; pkg-vertico.el ends here
