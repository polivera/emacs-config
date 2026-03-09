;;; pkg-perspective.el --- Perspective workspace management -*- lexical-binding: t; -*-

;;; Commentary:

;; Provides named workspaces (perspectives) with isolated buffer lists.
;; Link: https://github.com/nex3/perspective-el

;;; Code:

(use-package perspective
  :ensure t
  :init
  (setq persp-state-default-file xap/const/perspective-state-file)
  (setq persp-mode-prefix-key (kbd "C-c M-p"))
  :config
  (persp-mode 1)
  ;; Save perspective state on exit, restore on startup
  (add-hook 'kill-emacs-hook #'persp-state-save))

;; Auto-create a perspective named after the project when switching projects
(defun xap/persp-project-switch (dir)
  "Switch to a perspective named after the project at DIR."
  (let ((project-name (file-name-nondirectory
                       (directory-file-name dir))))
    (persp-switch project-name)))

(advice-add 'project-switch-project :before #'xap/persp-project-switch)

;; Filter consult-buffer by perspective buffer list (deferred until both are loaded)
(with-eval-after-load 'consult-buffer
  (setf (plist-get consult--source-buffer :hidden) t
        (plist-get consult--source-buffer :default) nil)
  (add-to-list 'consult-buffer-sources persp-consult-source))

(provide 'pkg-perspective)
;;; pkg-perspective.el ends here
