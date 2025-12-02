(setq inhibit-startup-screen t) ; Disable startup screen
(setq initial-scratch-message nil) ; Disable scratch buffer message

(setq create-lockfiles nil) ; Do not create lockfiles ; TODO: Make this consistent with Neovim

(setq backup-directory-alist `(("." . ,(expand-file-name "backups" user-emacs-directory)))) ; Backup directory ; TODO: Make this consistent with Neovim

(setq auto-save-file-name-transforms `((".*" ,(expand-file-name "autosaves" user-emacs-directory) t))) ; Autosave directory ; TODO: Make this consistent with Neovim

;; Load custom settings file
;; TODO: Make this consistent with Neovim
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file t)

(global-display-line-numbers-mode) ; Enable line numbering

(global-hl-line-mode) ; Enable line highlighting

(which-key-mode) ; Key mapping pop up helper

(editorconfig-mode) ; EditorConfig integration

(recentf-mode) ; Track recent files

(provide 'my-core-ui)
