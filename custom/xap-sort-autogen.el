;;; xap-sort-autogen.el --- Sort autogen files -*- lexical-binding: t; -*-
(defconst xap/const/elpa-path 
          (concat xap/const/autogen-folder-path "elpa/") 
          "Path to elpa directory inside autogen folder.")
(defconst xap/const/eln-cache-path 
          (concat xap/const/autogen-folder-path "eln-cache/") 
          "Path to eln cache direcory.")
(defconst xap/const/transient-history-file
          (concat xap/const/autogen-folder-path "transient-history.el") 
          "Set path to transient-history-file.")
(defconst xap/const/recentf-autogen-file 
          (concat xap/const/autogen-folder-path "recentf") 
          "Recentf db file path.")
(defconst xap/const/savehist-autogen-file 
          (concat xap/const/autogen-folder-path "savehist") 
          "Savehist files path.")
(defconst xap/const/places-autogen-file 
          (concat xap/const/autogen-folder-path "places") 
          "Places files path.")
(defconst xap/const/auto-saves-path 
          (concat xap/const/autogen-folder-path "auto-saves/") 
          "Path to folder that contains autosave data.")
(defconst xap/const/bookmark-file
          (concat xap/const/autogen-folder-path "bookmarks")
          "Path where bookmarks are stored")
(defconst xap/const/project-list-file
          (concat xap/const/autogen-folder-path "projects")
	  "Path to project list file for project.el")
(defconst xap/const/projectile-known-projects-file
          (concat xap/const/autogen-folder-path "projectile/projectile-bookmarks.eld")
          "Path to projectile known projects file.")
(defconst xap/const/projectile-cache-file
          (concat xap/const/autogen-folder-path "projectile/projectile.cache")
          "Path to projectile cache file.")
(defconst xap/const/perspective-state-file
          (concat xap/const/autogen-folder-path "projectile/perspective-state")
          "Path to perspective state file.")
(defconst xap/const/straight-path
          (concat xap/const/autogen-folder-path "straight")
          "Path to straight installation and package build")


;; Create folder for auto-generated files and package folder
(unless (file-directory-p xap/const/autogen-folder-path)
  (make-directory xap/const/autogen-folder-path t)
  (make-directory xap/const/elpa-path t)
  (make-directory xap/const/eln-cache-path t)
  (make-directory xap/const/auto-saves-path t)
  (make-directory xap/const/straight-path t)
  (make-directory (concat xap/const/autogen-folder-path "projectile/") t)
)


;; Create the rest of auto-generated files

;; Set created folders
(setq package-user-dir xap/const/elpa-path)
(setq native-compile-cache-dir xap/const/eln-cache-path)
(setq comp-native-compile-dest-dir xap/const/eln-cache-path)
(setq native-comp-eln-load-path (cons xap/const/eln-cache-path (default-value 'native-comp-eln-load-path)))


;; Autogenerate files
(setq transient-history-file xap/const/transient-history-file) ;; Set transient file to junk
(setq make-backup-files nil) ;; Disable backup files
(setq custom-file (make-temp-file "emacs-custom")) ;; Set custom config to a temporary file
(setq recentf-save-file xap/const/recentf-autogen-file) ;; recentf
(setq savehist-file xap/const/savehist-autogen-file) ;; savehist
(setq save-place-file xap/const/places-autogen-file) ;; places
(setq auto-save-list-file-prefix xap/const/auto-saves-path) ;; Auto save session, files and locks
(setq auto-save-file-name-transforms `((".*" ,xap/const/auto-saves-path t))) ;; Set lock files path
(setq lock-file-name-transforms `((".*" ,xap/const/auto-saves-path t)))
(setq bookmark-default-file xap/const/bookmark-file)
(setq project-list-file xap/const/project-list-file)

;; Built-in mode configurations
(show-paren-mode 1)
(electric-pair-mode 1)
(delete-selection-mode 1)
(recentf-mode 1)

(provide 'xap-sort-autogen)
