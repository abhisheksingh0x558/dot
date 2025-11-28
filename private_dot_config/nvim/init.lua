-- Load plugin manager
vim.opt.runtimepath:prepend(vim.fs.normalize("~/.local/share/nvim/lazy/lazy.nvim"))
local lazy = require("lazy")

-- Load core modules
require("my.core.keymap")

-- Setup plugins
lazy.setup()
