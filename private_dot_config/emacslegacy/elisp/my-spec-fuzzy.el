(leaf vertico) ; Mini-buffer completion UI

;; Fuzzy matcher
(leaf prescient
  :custom ((prescient-filter-method . '(fuzzy))))

(leaf vertico-prescient) ; Prescient extension for Vertico

(leaf corfu-prescient) ; Prescient extension for Corfu

;; Mini-buffer commands
(leaf consult
  :custom ((xref-show-xrefs-function . #'consult-xref)))

(leaf consult-lsp) ; LSP command for Corfu

(provide 'my-spec-fuzzy)
