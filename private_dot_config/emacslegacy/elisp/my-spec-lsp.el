(leaf lsp-mode
  :custom
  ((lsp-completion-enable . nil) ; Disable autocompletion setup
    (lsp-diagnostics-provider . :none) ; Disable diagnostics setup
    (lsp-references-exclude-declaration . t))) ; Exclude declaration from LSP references

(leaf lsp-ui
  :custom
  ((lsp-ui-doc-show-with-mouse . nil) ; Do not show LSP hover documentation on mouse hover
    (lsp-ui-doc-position . 'at-point))) ; Show LSP hover documentation above cursor

(provide 'my-spec-lsp)
