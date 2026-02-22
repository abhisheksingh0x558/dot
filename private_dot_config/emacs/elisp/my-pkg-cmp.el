(global-corfu-mode)

(yas-global-mode) ; Enable snippet engine

;; TODO: Add yasnippet capf for cases where lsp is not available
(add-hook 'lsp-completion-mode  #'(lambda ()
                          (add-to-list 'completion-at-point-functions (cape-capf-super #'lsp-completion-at-point #'yasnippet-capf)))

(provide 'my-pkg-cmp)
