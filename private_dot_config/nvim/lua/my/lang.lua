local treesitter = require("nvim-treesitter")
local lint = require("lint")
local conform = require("conform")

local languages = {
	-- Nushell
	nu = {
		language_server = "nushell",
		-- TODO: Add linters
		-- TODO: Add formatters
	},

	-- Zsh
	zsh = {
		language_server = "bashls",
		linters = { "shellcheck" },
		formatters = { "shfmt" },
	},

	-- Bash
	bash = {
		language_server = "bashls",
		linters = { "shellcheck" },
		formatters = { "shfmt" },
	},

	-- Just
	just = {
		-- TODO: Add language server
		-- TODO: Add linters
		formatters = { "just" },
	},
}

-- Setup language tools
-- TODO: Fix check the executable as not all executable are named as the config name
-- TODO: Check for executable before setting up language servers, linters, and formatters
local function setup_language(filetype, config)
	-- Install treesitter parser
	local installed = false
	for _, parser in ipairs(treesitter.get_installed()) do
		if filetype == parser then
			installed = true
		end
	end
	if not installed then
		treesitter.install(filetype)
	end

	-- Register language server
	if config.language_server then
		vim.lsp.enable(config.language_server)
	end

	-- Register linter
	if config.linters then
		lint.linters_by_ft[filetype] = config.linters
	end

	-- Register formatter
	if config.formatters then
		conform.formatters_by_ft[filetype] = config.formatters
	end
end

-- Setup tools for all configured languages
lint.linters_by_ft = {}
local filetypes = {}
for filetype, config in pairs(languages) do
	table.insert(filetypes, filetype)
	setup_language(filetype, config)
end

-- TODO: Autocmd to cleanup extra blank lines at end of file
