(global-diff-hl-mode)

(evil-define-key 'normal 'global
  "]x" #'smerge-next ; Go to next conflict
  "[x" #'smerge-prev) ; Go to previous conflict

(evil-define-key 'normal smerge-mode-map
  "co" #'smerge-keep-upper ; Choose ours
  "ct" #'smerge-keep-lower ; Choose theirs
  "cb" #'smerge-keep-all ; Choose both
  "c0" #'smerge-keep-base) ; Choose none

(evil-define-key 'normal 'global (kbd "<leader>gg") #'magit) ; Open git client
(evil-define-key 'normal magit-mode-map "C-r" #'magit-refresh) ; Refresh magit status

(evil-define-key 'normal 'global
  "[c" #'diff-hl-previous-hunk ; Go to previous hunk
  "]c" #'diff-hl-next-hunk) ; Go to next hunk

(provide 'my-pkg-vcs)
