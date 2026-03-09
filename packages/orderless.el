;;; orderless.el --- Orderless completion style -*- lexical-binding: t; -*-

(use-package orderless
  :ensure (:wait t)
  :demand t
  :custom
  (setq completion-styles '(orderless basic))
  (setq orderless-component-separator '[ orderless-greed: " "]))

(provide 'orderless)

;;; orderless.el ends here
