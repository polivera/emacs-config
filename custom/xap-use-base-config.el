(use-package emacs
  :ensure nil
  :config
  ;; Clean up the mode line
  (display-time-mode -1)
  (setq column-number-mode t)

  ;; Less noise when compiling elisp
  (setq byte-compile-warnings '(not free-vars unresolved noruntime lexical make-local))
  
  (setq load-prefer-newer t)

  ;; Set modeline options
  (display-time-mode 1)
  (setq column-number-mode t)

  ;; always allow 'y' instead of 'yes'.
  (defalias 'yes-or-no-p 'y-or-n-p)

  ;; Start maximize
  (add-to-list 'default-frame-alist '(fullscreen . maximized))

  ;; Font configuration
  (when (find-font (font-spec :name xap/const/font-family))
    (setq xap/var/def-font-size (if xap/const/is-macos xap/const/font-size-macos xap/const/font-size-linux))
    (set-face-attribute 'default nil :font xap/const/font-family :height xap/var/def-font-size)
    (set-face-attribute 'fixed-pitch nil :font xap/const/font-family)
    (set-face-attribute 'variable-pitch nil :font xap/const/font-family)
    )

  ;; Exclusive macOS configs
  (when xap/const/is-macos
    (setq mac-command-modifier 'meta)     ; command as super
    (setq mac-option-modifier 'super)     ; alt as meta
    (setq mac-control-modifier 'control))
  
  ;; Clipboard integration with the OS
  (setq select-enable-clipboard t)
  (setq select-enable-primary nil)

  ;; Set zoom in and zoom out
  (global-set-key (kbd "C-=") 'text-scale-increase)
  (global-set-key (kbd "C--") 'text-scale-decrease)
  (global-set-key (kbd "C-0") #'(lambda() (interactive) (text-scale-set 0)))
  )

(provide 'xap-use-base-config)
