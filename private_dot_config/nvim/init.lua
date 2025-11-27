-- Load plugin manager
vim.opt.runtimepath:prepend(vim.fs.normalize("~/.local/share/nvim/lazy/lazy.nvim"))
local lazy = require("lazy")

-- Load core modules
require("my.core.keymap")
require("my.core.ui")
require("my.core.spell")

-- Setup plugins
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
