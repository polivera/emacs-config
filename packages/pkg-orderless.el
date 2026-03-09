;;; pkg-orderless.el --- Orderless completion style -*- lexical-binding: t; -*-

(use-package orderless
  :ensure t
  :demand t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles orderless basic))))
  (orderless-component-separator #'orderless-escapable-split-on-space)
  (completion-ignore-case t)
  (read-file-name-completion-ignore-case t))

(provide 'pkg-orderless)

;;; pkg-orderless.el ends here
