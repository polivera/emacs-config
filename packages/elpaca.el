;;; elpaca.el --- Elpaca package manager installation -*- lexical-binding: t; -*-

(defvar elpaca-directory (expand-file-name "elpaca/" user-emacs-directory))
(defvar elpaca-repo "https://github.com/progfolio/elpaca.git")

(unless (file-directory-p elpaca-directory)
  (make-directory elpaca-directory t)
  (unless (executable-find "git")
    (error "Git is required to install elpaca"))
  (message "Cloning elpaca...")
  (shell-command (format "git clone --depth 1 %s %s" elpaca-repo elpaca-directory)))

(add-to-list 'load-path elpaca-directory)
(require 'elpaca)
(elpaca-defeats)

(elpaca use-package)

(provide 'elpaca)

;;; elpaca.el ends here
