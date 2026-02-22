;; TODO: Autoload this package
(require 'treesit-auto)

(treesit-auto-add-to-auto-mode-alist 'all) ; Enable treesitter based mode for all available parsers

(global-treesit-auto-mode) ; Autodetect tresitter mode

(provide 'my-pkg-ts)
