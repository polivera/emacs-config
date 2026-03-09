;;; pkg-consult.el --- Consult search and navigation -*- lexical-binding: t; -*-

(use-package consult
  :ensure t
  :general
  (xap/leader-key
    "f" '(nil :which-key "Find")
    "ff" '(consult-fd :which-key "Files")
    "fj" '(consult-ripgrep :which-key "Text in files")
    "fb" '(consult-bookmark :which-key "Bookmarks")
    "fo" '(consult-outline :which-key "Org Outline")
    "fb" '(consult-buffer :which-key "Buffers"))
  (xap/quick-leader
    "b" '(consult-buffer :which-key "List buffers")
    "f" '(consult-fd :which-key "Find files")
    "j" '(consult-ripgrep :which-key "Find text")))

(provide 'pkg-consult)

;;; pkg-consult.el ends here
