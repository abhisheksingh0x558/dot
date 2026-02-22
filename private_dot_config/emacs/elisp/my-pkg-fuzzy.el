(vertico-mode) ; Mini-buffer completion UI

(vertico-prescient-mode) ; Prescient extension for Vertico

(corfu-prescient-mode) ; Prescient extension for Corfu

(prescient-persist-mode) ; Fuzzy matcher

(evil-define-key 'normal 'global
  ;; Find files in current directory
  (kbd "<leader>SPC") #'(lambda ()
                          (interactive)
                          (if (project-current)
                              (call-interactively #'project-find-file)
                            (call-interactively #'consult-fd)))
  ;; Find buffers
  (kbd "<leader>TAB") #'(lambda ()
                          (interactive)
                          (if (project-current)
                              (call-interactively #'consult-project-buffer)
                            (call-interactively #'consult-buffer)))
  (kbd "<leader>BS") #'consult-recent-file ; Find recent files
  "g/" #'consult-line ; Search current file
  (kbd "<leader>/") #'consult-ripgrep) ; Search project buffers

(provide 'my-pkg-fuzzy)
