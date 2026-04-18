(evil-define-key 'normal 'global
  ;; Find notes
  ;; TODO: Abstract a common function for this lambda
  (kbd "<leader>nn") #'(lambda ()
                        (interactive)
                        (let ((project-current-directory-override org-directory))
                          (project-find-file-in nil (list org-directory) (project-current t org-directory) t)))
  ;; Find zettelkasten notes
  ;; TODO: Abstract a common function for this lambda
  (kbd "<leader>nz") #'(lambda ()
                        (interactive)
                        (let ((project-current-directory-override org-roam-directory))
                          (project-find-file-in nil (list org-roam-directory) (project-current t org-roam-directory) t)))
  (kbd "<leader>a") #'org-agenda) ; Open org agenda

(provide 'my-pkg-note)
