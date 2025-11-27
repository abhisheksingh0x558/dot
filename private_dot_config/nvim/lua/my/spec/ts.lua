return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		branch = "main", -- TODO: Remove this when main is set as default branch
		build = ":TSUpdate",
	},

	-- Text objects
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		branch = "main", -- TODO: Remove this when main is set as default branch
		opts = {
			select = {
				lookahead = true, -- Automatically jump forward to text object
			},
		},
	},
}
