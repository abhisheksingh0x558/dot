;; Vi layer
(leaf evil
   :custom
   ((evil-want-keybinding . nil) ; Do not set key mappings
    (evil-undo-system . #'undo-redo))) ; Key mapping for redo

(leaf evil-collection
  :custom ((evil-collection-key-blacklist . '("]q" "[q")))) ; Disable key mappings

(leaf evil-commentary) ; Manipulate comments

(leaf evil-surround) ; Manipulate surrounding pairs

(leaf evil-exchange) ; Exchange text

(leaf evil-string-inflection) ; Manipulate text cases

(leaf evil-snipe) ; Navigate with search labels

(leaf evil-lion) ; Manipulate alignments

(provide 'my-spec-keymap)
