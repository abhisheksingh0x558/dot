vim.opt.shortmess:append("I") -- Disable intro message

vim.opt.exrc = true -- Project specific settings
vim.opt.secure = true -- Allow trusting project specific settings

vim.opt.number = true -- Enable line numbering
vim.opt.cursorline = true -- Enable line highlighting

vim.opt.clipboard = "unnamedplus" -- Use system clipboard

vim.opt.ignorecase = true -- Ignore case while searching
vim.opt.smartcase = true -- Respect case if pattern has upper case characters otherwise ignore it

vim.opt.splitright = true -- Put new window towards right on vertical split
vim.opt.splitbelow = true -- Put new window towards bottom on horizontal split

-- TODO: Remove this when bash filetype detection works properly
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	group = vim.api.nvim_create_augroup("my-bash-filetype", {}),
	callback = function()
		local first = vim.fn.getline(1)
		if first:match("^#!.*bash") then
			vim.bo.filetype = "bash"
		end
	end,
})

-- TODO: Remove this when bash filetype detection works properly
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	group = vim.api.nvim_create_augroup("my-bash-dotfile-filetype", {}),
	pattern = {
		vim.fs.normalize("~/.bash_profile"),
		vim.fs.normalize("~/.bashrc"),
	},
	callback = function()
		vim.bo.filetype = "bash"
	end,
})

return {}
