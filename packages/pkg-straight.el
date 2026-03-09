;;; pkg-straight.el --- Straight package manager bootstrap -*- lexical-binding: t; -*-

(require 'sort-autogen)

(setq straight-base-dir xap/const/autogen-folder-path)

(defvar bootstrap-version)
(let ((bootstrap-file (expand-file-name "repos/straight.el/bootstrap.el" xap/const/straight-path))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))
(setq straight-use-package-by-default t)

(provide 'pkg-straight)
;;; pkg-straight.el ends here
