(evil-define-key 'normal 'global
  ;; Find dotfiles
  ;; TODO: Abstract a common function for this lambda
  (kbd "<leader>d") #'(lambda ()
                        (interactive)
                        (let* ((dotfile-directory "~/.dot")
                                (project-current-directory-override dotfile-directory))
                          (project-find-file-in nil (list dotfile-directory) (project-current t dotfile-directory) t))))

(provide 'my-pkg-dot)
