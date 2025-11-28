-- Load plugin manager
vim.opt.runtimepath:prepend(vim.fs.normalize("~/.local/share/nvim/lazy/lazy.nvim"))
vim.opt.runtimepath:prepend(vim.fs.normalize("~/.local/share/nvim/lazy/hotpot.nvim")) -- TODO: Remove this
local lazy = require("lazy")

-- Load core modules
require("my.core.keymap")
require("my.core.ui")
require("my.core.spell")

-- Setup plugins
require("hotpot") -- TODO: Remove this
lazy.setup({
	{ import = "my.spec.lib" },
	{ import = "my.spec.transpile" },
	{ import = "my.spec.keymap" },
	{ import = "my.spec.ui" },
	{ import = "my.spec.cmp" },
	{ import = "my.spec.fuzzy" },
	{ import = "my.spec.vcs" },
})

-- Load plugin modules
require("my.plug.ui")
require("my.plug.fuzzy")
require("my.plug.vcs")
