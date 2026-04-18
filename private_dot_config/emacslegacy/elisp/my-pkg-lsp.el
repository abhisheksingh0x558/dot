(evil-define-key 'normal 'global
  "grr" #'lsp-find-references ; Find LSP references
  "gri" #'lsp-find-implementation) ; Find LSP implementations

(evil-define-key 'normal 'global "K" #'lsp-ui-doc-glance) ; Show LSP hover documentation

(provide 'my-pkg-lsp)
