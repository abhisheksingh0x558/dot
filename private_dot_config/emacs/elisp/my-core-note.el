(setq org-directory "~/Documents/note") ; Org directory
(setq org-agenda-files `(,org-directory)) ; Org agenda files
(setq org-default-notes-file (expand-file-name "note.org" org-directory)) ; Org capture file
(setq org-log-done 'time) ; Org log time of completion
(setq org-deadline-warning-days 0) ; Org duration to trigger deadline warnings

(provide 'my-core-note)
