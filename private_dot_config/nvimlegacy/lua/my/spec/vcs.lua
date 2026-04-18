return {
	{
		"folke/snacks.nvim",
		opts = {
			-- Git client
			gitbrowse = { enabled = true },
		},
	},

	-- Git client
	{
		"NeogitOrg/neogit",
		lazy = false,
		opts = {},
	},

	-- Git commands in file
	{
		"lewis6991/gitsigns.nvim",
		lazy = false,
		opts = {},
	},

	-- Git commands in file
	{
		"akinsho/git-conflict.nvim",
		opts = {},
	},

	-- Cycle diffs
	{
		"sindrets/diffview.nvim",
		opts = {},
	},
}
