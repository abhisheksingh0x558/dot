(setq evil-vsplit-window-right t) ; Put new window on right on vertical split
(setq evil-split-window-below t) ; Put new window on bottom on horizontal split

(load-theme 'doom-tokyo-night t) ; Theme

(doom-modeline-mode) ; Modeline

;; TODO: Replace with lsp alternative
(breadcrumb-mode) ; Breadcrumbs

(highlight-indent-guides-mode) ; Indentation guides

(global-hl-todo-mode) ; Highlight to do comments

;; TODO: Replace with lsp alternative
(symbol-overlay-mode) ; Highlight lsp references

(rainbow-delimiters-mode) ; Highlight brackets

(evil-define-key 'normal xref--xref-buffer-mode-map
  "j" #'xref-next-line ; Go to next xref entry
  "k" #'xref-prev-line) ; Go to previous xref entry

(provide 'my-pkg-ui)
