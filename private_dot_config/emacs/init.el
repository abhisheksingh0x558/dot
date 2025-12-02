;; -*- lexical-binding: t -*-

;; Elisp path
(defvar my-elisp-path (expand-file-name "elisp" user-emacs-directory))
(add-to-list 'load-path my-elisp-path) ; Custom modules

;; Load package manager
(setq elpaca-installer-version 0.11)
(let ((elpaca-path (expand-file-name "elpaca/repos/elpaca" user-emacs-directory)))
  (add-to-list 'load-path elpaca-path)
  (unless (require 'elpaca-autoloads nil t)
    (require 'elpaca)
    (elpaca-generate-autoloads "elpaca" elpaca-path)))
(require 'elpaca-autoloads)
(add-hook 'after-init-hook #'elpaca-process-queues)
(elpaca (elpaca :repo "https://github.com/progfolio/elpaca.git" :build (:not elpaca--activate-package)))
(elpaca leaf
  (require 'leaf)
  (setq leaf-defaults '(:elpaca t)))
(elpaca leaf-keywords
  (require 'leaf-keywords)
  (leaf-keywords-init))
(elpaca-wait)

;; Load core modules
(require 'my-core-ui)

;; Setup packages
(require 'my-spec-keymap)
(require 'my-spec-ui)
(elpaca-wait)

;; Load package modules
(require 'my-pkg-keymap)
(require 'my-pkg-ui)
