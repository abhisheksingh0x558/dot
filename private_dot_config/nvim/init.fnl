(macro install-pack [repo]
  `(vim.pack.add [,(.. "https://github.com/" repo)]))

;; Lua transpiler
(install-pack :rktjmp/hotpot.nvim)

;;; Key mappings

;; Leader key
(set vim.g.mapleader " ")
;; Local leader key
(set vim.g.maplocalleader "\\")

;; Command line prefix history search upward
(vim.keymap.set :n :<C-k> :<Up>)
;; Command line prefix history search downward
(vim.keymap.set :n :<C-j> :<Down>)

;; Switch from terminal mode to normal mode
(vim.keymap.set :t :<Esc> "<C-\\><C-n>")
;; Send escape key to program running in terminal
(vim.keymap.set :t "<C-\\><C-n>" :<Esc>)

;;; UI/UX
;; Disable intro message
(vim.opt.shortmess:append :I)

;; Project specific settings
(set vim.opt.exrc true)
;; Allow trusting project specific settings
(set vim.opt.secure true)

;; Enable line numbering
(set vim.opt.number true)
;; Enable line highlighting
(set vim.opt.cursorline true)

(set vim.opt.clipboard :unnamedplus)

;; Ignore case while searching
(set vim.opt.ignorecase true)
;; Respect case if pattern has upper case characters otherwise ignore it
(set vim.opt.smartcase true)

;; Fuzzy finder
(install-pack :folke/snacks.nvim)
(local snacks (require :snacks))
(snacks.setup {:picker {:enabled true}})

{}
