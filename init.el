;;; init.el --- Emacs Initialization -*- lexical-binding: t; -*-

;;; Commentary:

;; This file is mostly used to include all other individual configuration files

;;; Code:

(require 'xap-custom-vars)
(require 'xap-sort-autogen)

(require 'pkg-elpaca)

(require 'pkg-exec-path)
;; Themes — uncomment one at a time to try them
;; (require 'pkg-catppuccin)
;; (require 'pkg-modus-themes)
(require 'pkg-doom-themes)
;; (require 'pkg-ef-themes)

(require 'xap-use-base-config)
(require 'pkg-general)
(require 'pkg-evil)
(require 'pkg-vertico)
(require 'pkg-orderless)
(require 'pkg-marginalia)
(require 'pkg-which-key)
(require 'pkg-magit)
(require 'pkg-consult)
(require 'pkg-corfu)
(require 'pkg-doom-modeline)
(require 'pkg-perspective)

;;; init.el ends here
