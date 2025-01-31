;; -*- lexical-binding: t -*-

((nil . ((eval . (add-hook 'find-file-hook
                           (lambda ()
                             (let* ((root (project-root (project-current)))
                                    (file  (file-relative-name buffer-file-name root)))
                               (pcase file
                                 (".chezmoi.toml.tmpl" (conf-toml-mode))
                                 ("dot_editorconfig" (editorconfig-conf-mode))
                                 ("dot_Brewfile.tmpl" (ruby-ts-mode))
                                 ("private_dot_config/git/config" (gitconfig-mode))
                                 ("private_dot_config/git/ignore" (gitignore-mode))
                                 ("dot_ssh/private_config" (conf-space-mode))
                                 ("private_dot_gnupg/gpg-agent.conf.tmpl" (conf-space-mode))
                                 ("dot_zshenv" (sh-mode)))))
                           nil t)))))
