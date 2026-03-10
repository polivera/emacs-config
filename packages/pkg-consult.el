;;; pkg-consult.el --- Consult search and navigation -*- lexical-binding: t; -*-

(use-package consult
  :ensure t
  :config
  (setq consult-async-min-input 1)
  (setq consult-async-input-debounce 0)
  (setq consult-async-input-throttle 0)
  :general
  (xap/leader-key
    "f" '(nil :which-key "Find")
    "ff" '(consult-fd :which-key "Files")
    "fj" '(consult-ripgrep :which-key "Text in files")
    "fk" '(consult-bookmark :which-key "Bookmarks")
    "fo" '(consult-outline :which-key "Org Outline")
    "fb" '(consult-buffer :which-key "Buffers")
    "ft" '(consult-theme :which-key "Theme")
    "p" '(nil :which-key "Project")
    "pp" '(project-switch-project :which-key "Switch project")
    "pf" '(project-find-file :which-key "Find file in project")
    "pd" '(project-find-dir :which-key "Find dir in project")
    "i" '(nil :which-key "Perspective")
    "is" '(persp-switch :which-key "Switch perspective")
    "ik" '(persp-kill :which-key "Kill perspective")
    "il" '(persp-switch-last :which-key "Last perspective")
    "in" '(persp-next :which-key "Next perspective")
    "ip" '(persp-prev :which-key "Previous perspective"))
  (xap/quick-leader
    "b" '(consult-buffer :which-key "List buffers")
    "f" '(consult-fd :which-key "Find files")
    "j" '(consult-ripgrep :which-key "Find text")
    "p" '(project-switch-project :which-key "Switch project")))

(provide 'pkg-consult)

;;; pkg-consult.el ends here
