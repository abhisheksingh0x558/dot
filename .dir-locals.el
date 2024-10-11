;; -*- lexical-binding: t -*-

((nil . ((eval . (add-hook 'find-file-hook
                           (lambda ()
                             (let* ((root (project-root (project-current)))
                                    (file  (file-relative-name buffer-file-name root)))
                               (pcase file
                                 (".chezmoi.toml.tmpl" (conf-toml-mode))
                                 ("dot_editorconfig" (editorconfig-conf-mode)))))
                           nil t)))))
