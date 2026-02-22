local picker = Snacks.picker

-- Find notes
vim.keymap.set("n", "<Leader>nn", function()
	picker.files({ cwd = my.spec.note.note_directory })
end)
-- Find zettelkasten notes
vim.keymap.set("n", "<Leader>nz", function()
	picker.files({ cwd = my.spec.note.zettelkasten_note_directory })
end)

return {}
