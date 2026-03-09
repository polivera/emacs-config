;;; pkg-exec-path.el --- Inherit system PATH -*- lexical-binding: t; -*-

(use-package exec-path-from-shell
  :ensure t
  :demand t
  :config
  (exec-path-from-shell-initialize))

(provide 'pkg-exec-path)

;;; pkg-exec-path.el ends here
