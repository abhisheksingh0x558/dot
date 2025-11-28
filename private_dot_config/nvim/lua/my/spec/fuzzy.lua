return {
	"folke/snacks.nvim",
	opts = {
		picker = {
			enabled = true,
			layout = {
				preset = "bottom", -- Show fuzzy finder at the bottom
			},
			sources = {
				files = {
					hidden = true, -- Show hidden files
				},
				grep = {
					hidden = true, -- Show hidden files
				},
			},
		},
	},
}
