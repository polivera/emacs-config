;;; init.el --- Emacs Initialization -*- lexical-binding: t; -*-

;;; Commentary:

;; This file is mostly used to include all other individual configuration files

;;; Code:

(require 'xap-custom-vars)
(require 'xap-sort-autogen)

(require 'pkg-elpaca)

(require 'xap-use-base-config)
(require 'pkg-general)
(require 'pkg-evil)
(require 'pkg-vertico)
(require 'pkg-orderless)
(require 'pkg-marginalia)
(require 'pkg-magit)

;;; init.el ends here
