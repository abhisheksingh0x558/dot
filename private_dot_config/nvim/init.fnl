(macro install-pack [repo]
  `(vim.pack.add [,(.. "https://github.com/" repo)]))

;; Lua transpiler
(install-pack :rktjmp/hotpot.nvim)

(set vim.g.mapleader " ")
(set vim.g.maplocalleader "\\")

;; Command line prefix history search upward
(vim.keymap.set :n :<C-k> :<Up>)
;; Command line prefix history search downward
(vim.keymap.set :n :<C-j> :<Down>)

;; Switch from terminal mode to normal mode
(vim.keymap.set :t :<Esc> "<C-\\><C-n>")
;; Send escape key to program running in terminal
(vim.keymap.set :t "<C-\\><C-n>" :<Esc>)

{}
