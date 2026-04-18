;; In-buffer completion UI
(leaf corfu
  :custom
  ((corfu-auto . t)
    (corfu-auto-prefix . 1))) ; Trigger autocompletion popup after typing 1 character

(leaf cape) ; In-buffer completion extensions

(leaf yasnippet-capf) ; In-buffer completion extension for Yasnippet

(leaf yasnippet) ; Snippet engine

(leaf yasnippet-snippets) ; Snippet collection

(provide 'my-spec-cmp)
