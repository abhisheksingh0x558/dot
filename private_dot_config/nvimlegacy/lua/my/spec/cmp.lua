return {
	{
		"saghen/blink.cmp",
		version = "*",
		opts = {
			keymap = { preset = "super-tab" }, -- Use tab for autocompletion
		},
	},

	-- Auto close pairs
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},

	"rafamadriz/friendly-snippets", -- Snippet collection
}
