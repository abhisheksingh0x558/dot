return {
	{
		"folke/snacks.nvim",
		opts = {
			-- Indentation guides
			indent = { enabled = true },
		},
	},

	"folke/tokyonight.nvim", -- Theme

	-- Statusline
	{
		"nvim-lualine/lualine.nvim",
		opts = {},
	},

	-- Icons
	{
		"nvim-tree/nvim-web-devicons",
		opts = {},
	},

	"MunifTanjim/nui.nvim", -- UI component library -- TODO: Use luarocks to manage this and remove from here

	-- UI for messages, cmdline, and popupmenu
	{
		"folke/noice.nvim",
		opts = {
			cmdline = {
				view = "cmdline", -- Show command line at the bottom
			},
		},
	},

	-- Breadcrumbs
	{
		"Bekaboo/dropbar.nvim",
		opts = {},
	},

	-- Cursor context
	{
		"nvim-treesitter/nvim-treesitter-context",
		opts = {},
	},

	-- UI for diagnostics, references, quickfix list and location list
	{
		"folke/trouble.nvim",
		lazy = false,
		opts = {
			focus = true, -- Move cursor to trouble window when open
		},
	},

	-- Highlight to do comments
	{
		"folke/todo-comments.nvim",
		lazy = false,
		opts = {},
	},

	"RRethy/vim-illuminate", -- Highlight LSP references

	"HiPhish/rainbow-delimiters.nvim", -- Highlight brackets

	--  Key mapping pop up helper
	{
		"folke/which-key.nvim",
		opts = {},
	},
}
