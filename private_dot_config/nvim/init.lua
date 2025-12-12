-- Load plugin manager
vim.opt.runtimepath:prepend(vim.fs.normalize("~/.local/share/nvim/lazy/lazy.nvim"))
local lazy = require("lazy")

-- Load core modules
require("my.core.keymap")
require("my.core.ui")
require("my.core.spell")
require("my.core.fold")
require("my.core.ts")
require("my.core.lsp")
require("my.core.lint")

-- Setup plugins
lazy.setup({
	{ import = "my.spec.lib" },
	{ import = "my.spec.transpile" },
	{ import = "my.spec.keymap" },
	{ import = "my.spec.ui" },
	{ import = "my.spec.cmp" },
	{ import = "my.spec.fuzzy" },
	{ import = "my.spec.vcs" },
	{ import = "my.spec.note" },
	{ import = "my.spec.file" },
	{ import = "my.spec.term" },
	{ import = "my.spec.repl" },
	{ import = "my.spec.exec" },
	{ import = "my.spec.fold" },
	{ import = "my.spec.outline" },
	{ import = "my.spec.ts" },
	{ import = "my.spec.lsp" },
	{ import = "my.spec.lint" },
	{ import = "my.spec.format" },
	{ import = "my.spec.test" },
	{ import = "my.spec.debug" },
	{ import = "my.spec.ai" },
	{ import = "my.spec.dot" },
	{ import = "my.spec.rest" },
})

-- Load plugin modules
require("my.plug.ui")
require("my.plug.fuzzy")
require("my.plug.vcs")
require("my.plug.file")
require("my.plug.term")
require("my.plug.outline")
require("my.plug.ts")
require("my.plug.lint")
require("my.plug.format")
