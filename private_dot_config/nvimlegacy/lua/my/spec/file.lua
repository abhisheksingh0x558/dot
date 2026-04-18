return {
	{
		"folke/snacks.nvim",
		opts = {
			-- File system explorer in sidebar
			explorer = {
				enabled = true,
				sources = {
					files = {
						hidden = true, -- Show hidden files
					},
				},
			},
		},
	},

	-- File system explorer in buffer
	{
		"stevearc/oil.nvim",
		opts = {},
	},

	-- Commands for managing files and directories
	{
		"chrisgrieser/nvim-genghis",
		opts = {},
	},
}
