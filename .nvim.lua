vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	group = vim.api.nvim_create_augroup("my-dotfile-filetype", {}),
	callback = function(arg)
		local root = vim.fs.root(arg.file, ".git")
		local file = arg.file:sub(#root + 2)
		if file == ".chezmoi.toml.tmpl" then
			vim.bo.filetype = "toml"
		elseif file == "dot_editorconfig" then
			vim.bo.filetype = "editorconfig"
		elseif file == "dot_Brewfile.tmpl" then
			vim.bo.filetype = "ruby"
		elseif file == "private_dot_config/git/config" then
			vim.bo.filetype = "gitconfig"
		elseif file == "private_dot_config/git/ignore" then
			vim.bo.filetype = "gitignore"
		elseif file == "dot_ssh/private_config" then
			vim.bo.filetype = "sshconfig"
		end
	end,
})
