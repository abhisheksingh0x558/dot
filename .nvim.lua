vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	group = vim.api.nvim_create_augroup("my-dotfile-filetype", {}),
	callback = function(arg)
		local root = vim.fs.root(arg.file, ".git")
		local file = arg.file:sub(#root + 2)
		if file == ".chezmoi.toml.tmpl" then
			vim.bo.filetype = "toml"
		end
	end,
})
