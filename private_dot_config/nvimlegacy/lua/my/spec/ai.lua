return {
	-- Model
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		opts = {},
	},

	-- Agent
	{
		"yetone/avante.nvim",
		event = "VeryLazy",
		build = "make",
		opts = {
			provider = "copilot",
			auto_suggestions_provider = "copilot",
			input = {
				provider = "snacks", -- Fuzzy finder
			},
			behaviour = {
				auto_suggestions = true, -- Autosuggestions -- TODO: Check if this is required
			},
		},
	},
}
