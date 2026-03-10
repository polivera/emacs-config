;;; xap-custom-vars.el --- Custom variables definition -*- lexical-binding: t; -*-

;; Early init
(defconst xap/const/gc-cons-threshold gc-cons-threshold "The value for gc-cons-threshold after initialization")
(defconst xap/const/gc-cons-percentage gc-cons-percentage "Default value of \"gc-cons-percentage\".")
(defconst xap/const/vc-handled-backends vc-handled-backends "Default value of \"vc-handled-backends\".")
(defconst xap/const/read-process-output (* 1024 1024 4) "Default value for \"read-process-output-max\" (4M).")
(defconst xap/const/file-name-handler-alist file-name-handler-alist "Default value of \"file-name-handler-alist\".")

;;; CheckOS
(defconst xap/const/is-linux (eq system-type 'gnu/linux) "Set to t if it is a linux system, nil otherwise.")
(defconst xap/const/is-macos (eq system-type 'darwin) "Set to t if it is a mac os system, nil otherwise.")
(defconst xap/const/is-window (eq system-type 'windows-nt) "Set to t if it is a windows system, nil otherwise.")

;; Initial theme
(defconst xap/const/initial-background-color "#25272f" "Initial background color (before apply theme).")
(defconst xap/const/initial-foreground-color "#B3B9C4" "Initial foreground color (before apply theme).")

;; Autogen Saved path
(defconst xap/const/autogen-folder-path 
          (concat user-emacs-directory "autogen/") 
          "Path to auto generated files.")

;; Font configuration
(defconst xap/const/font-family
  "AporeticSansMono Nerd Font"
  "Default font family.")
(defconst xap/const/font-size-macos
  145
  "Font size to use when on macos")
(defconst xap/const/font-size-linux
  125
  "Font size to use when on linux")

;; End of the file
(provide 'xap-custom-vars)
;;; custom-vars end here.
