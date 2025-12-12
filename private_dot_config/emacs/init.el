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
(require 'my-core-spell)
(require 'my-core-cmp)
(require 'my-core-note)

;; Setup packages
(require 'my-spec-keymap)
(require 'my-spec-ui)
(require 'my-spec-cmp)
(require 'my-spec-fuzzy)
(require 'my-spec-vcs)
(require 'my-spec-note)
(require 'my-spec-file)
(require 'my-spec-term)
(require 'my-spec-repl)
(require 'my-spec-exec)
(require 'my-spec-fold)
(require 'my-spec-outline)
(require 'my-spec-ts)
(require 'my-spec-lsp)
(require 'my-spec-lint)
(require 'my-spec-format)
(require 'my-spec-debug)
(require 'my-spec-ai)
(require 'my-spec-dot)
(require 'my-spec-rest)
(elpaca-wait)

;; Load package modules
(require 'my-pkg-keymap)
(require 'my-pkg-ui)
(require 'my-pkg-fuzzy)
(require 'my-pkg-vcs)
(require 'my-pkg-note)
(require 'my-pkg-ts)
(require 'my-pkg-lsp)
(require 'my-pkg-lint)
(require 'my-pkg-format)
(require 'my-pkg-dot)
