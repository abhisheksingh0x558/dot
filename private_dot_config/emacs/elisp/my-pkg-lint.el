(global-flycheck-mode)

(evil-define-key 'normal 'global
  "]q" #'next-error ; Go to next error or xref entry
  "[q" #'previous-error) ; Go to previous error or xref entry

(evil-define-key 'normal 'global
  "[d" #'flycheck-previous-error ; Go to previous flycheck entry
  "]d" #'flycheck-next-error) ; Go to next flycheck entry

(provide 'my-pkg-lint)
