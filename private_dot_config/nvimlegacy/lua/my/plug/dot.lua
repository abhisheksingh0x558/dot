local picker = Snacks.picker

-- Find dotfiles
vim.keymap.set("n", "<Leader>d", function()
	picker.files({ cwd = "~/.dot" })
end)

return {}
