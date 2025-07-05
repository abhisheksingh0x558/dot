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

	-- TODO: Setup Make

	-- Nix
	nix = {
		language_server = "nil_ls",
		linters = { "statix" },
		formatters = { "nixfmt" },
	},

	-- Beancount
	beancount = {
		language_server = "beancount",
		linters = { "bean_check" },
		formatters = { "bean-format" },
	},

	-- Typst
	typst = {},

	-- Lua
	lua = {
		language_server = "lua_ls",
		linters = { "luacheck" },
		formatters = { "stylua" },
	},

	-- Fennel
	fennel = {
		language_server = "fennel_ls",
		linters = { "fennel" },
		formatters = { "fnlfmt" },
	},

	-- Haskell
	haskell = {
		language_server = "hls",
		linters = { "hlint" },
		formatters = { "fourmolu" },
	},

	-- TODO: Setup Common Lisp

	-- TODO: Setup Zig

	-- Rust
	rust = {
		language_server = "rust_analyzer",
		linters = { "clippy" },
		formatters = { "rustfmt" },
	},

	-- TODO: Setup Racket

	-- Go
	go = {
		language_server = "gopls",
		linters = { "staticcheck" },
		formatters = { "gofumpt" },
	},

	-- Scala
	scala = {
		language_server = "metals",
		-- TODO: Add linters
		formatters = { "scalafmt" },
	},

	-- TODO: Setup Clojure

	-- TODO: Setup Kotlin

	-- JavaScript
	javascript = {
		language_server = "biome",
		linters = { "biomejs" },
		formatters = { "biome" },
	},

	-- PureScript
	purescript = {
		language_server = "purescriptls",
		-- TODO: Add linters
		formatters = { "purs-tidy" },
	},

	-- TypeScript
	typescript = {
		language_server = "biome",
		linters = { "biomejs" },
		formatters = { "biome" },
	},

	-- C++
	cpp = {
		language_server = "clangd",
		linters = { "cppcheck" },
		formatters = { "clang-format" },
	},

	-- Python
	python = {
		language_server = "ty",
		linters = { "ruff" },
		formatters = { "ruff_format" },
	},

	-- Protobuf
	proto = {
		language_server = "buf_ls",
		linters = { "buf_lint" },
		formatters = { "buf" },
	},

	-- TODO: Setup GraphQL

	-- JSON
	-- TODO: Setup JSON5
	json = {
		-- TODO: Add language server
		-- TODO: Add linters
		formatters = { "gojq" }, -- TODO: Check alternatives
	},
	jsonc = {
		-- TODO: Add language server
		-- TODO: Add linters
		formatters = { "gojq" }, -- TODO: Check alternatives
	},

	-- TOML
	toml = {
		-- TODO: Add language server
		-- TODO: Add linters
		formatters = { "taplo" }, -- TODO: Check alternatives
	},

	-- TODO: Setup YAML
	yaml = {
		-- TODO: Add language server
		-- TODO: Add linters
		formatters = { "yq" }, -- TODO: Check alternatives
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
