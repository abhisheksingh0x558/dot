my = my or {}
my.spec = my.spec or {}
my.spec.note = my.spec.note or {}
my.spec.note.note_directory = "~/Documents/note" -- Org directory
my.spec.note.zettelkasten_note_directory = my.spec.note.note_directory .. "/zettelkasten" -- Org roam directory

return {
	{
		"nvim-neorg/neorg",
		opts = {
			load = {
				["core.defaults"] = {},
				["core.concealer"] = {}, -- Convert markup to icons
			},
		},
	},

	{
		"nvim-orgmode/orgmode",
		event = "VeryLazy",
		opts = {
			org_agenda_files = my.spec.note.note_directory .. "/*.org", -- Org agenda files
			org_default_notes_file = my.spec.note.note_directory .. "/note.org", -- Org capture file
			mappings = {
				disable_all = true, -- Disable key mappings
			},
		},
	},

	-- Zettelkasten notes
	{
		"chipsenkbeil/org-roam.nvim",
		opts = {
			directory = my.spec.note.zettelkasten_note_directory,
			bindings = false, -- Disable key mappings
			org_startup_folded = "inherit", -- Disable folds
		},
	},
}
