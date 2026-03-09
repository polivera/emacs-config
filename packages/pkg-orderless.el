;;; pkg-orderless.el --- Orderless completion style -*- lexical-binding: t; -*-

(use-package orderless
  :ensure t
  :demand t
  :custom
  (setq completion-styles '(orderless basic))
  (setq orderless-component-separator '[ orderless-greed: " "]))

(provide 'pkg-orderless)

;;; pkg-orderless.el ends here
