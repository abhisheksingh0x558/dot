(require 'lsp-diagnostics) ; TODO: Autoload this package

;; Language settings
(defvar languages
  '(;; Nix
     (nix-ts-mode
       :language-server nix-nil
       :linters (statix)
       :formatters (nixfmt))

     ;; Beancount
     (beancount-mode
       :language-server beancount-ls
       :linters nil ; TODO: Add linters
       :formatters (bean-format))))

;; Setup language tools
;; TODO: Fix check the executable as not all executable are named as the config name
;; TODO: Check for executable before setting up language servers, linters, and formatters
(defun setup-language (mode config)
  (let ((language-server (plist-get config :language-server))
         (linters (plist-get config :linters))
         (formatters (plist-get config :formatters))
         (hook (intern (concat (symbol-name mode) "-hook"))))

    ;; Register language server
    (when language-server
      (add-hook hook
        #'(lambda ()
            (setq-local lsp-enabled-clients `(,language-server))
            (lsp-deferred))))

    ;; Register linters
    (when linters
      (add-hook hook
        #'(lambda ()
            (lsp-diagnostics-flycheck-enable)
            (setq-local flycheck-checker (car linters))
            (let ((current-linter (car linters)))
              (dolist (linter (cdr linters))
                (flycheck-add-next-checker current-linter `(t . ,linter) t)
                (setq current-linter linter))
              (flycheck-add-next-checker current-linter '(t . lsp) t)))))

    ;; Register formatters
    (when formatters
      (add-to-list 'apheleia-mode-alist `(,mode ,@formatters)))))

;; Setup tools for all configured languages
(setq apheleia-mode-alist '())
(dolist (language languages)
  (setup-language (car language) (cdr language)))

;; TODO: Hook to cleanup extra blank lines at end of file

;; Just support
;; TODO: Remove these
(leaf just-mode)
(leaf just-ts-mode)

;; Nix support
;; TODO: Remove these
(leaf nix-mode)
(leaf nix-ts-mode)

;; Beancount support
;; TODO: Remove these
(leaf beancount)
;; TODO: Setup beancount treesitter mode

(provide 'my-lang)
