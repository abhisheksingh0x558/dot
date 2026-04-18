local select = require("nvim-treesitter-textobjects.select")
local move = require("nvim-treesitter-textobjects.move")

-- Define select text object key mapping
local function define_select(key, query)
	vim.keymap.set({ "x", "o" }, key, function()
		select.select_textobject(query, "textobjects")
	end)
end

-- Select text object key mappings
local keymaps = {
	{ "af", "@function.outer" }, -- Select outside function
	{ "if", "@function.inner" }, -- Select inside function
	{ "ac", "@class.outer" }, -- Select outside class
	{ "ic", "@class.inner" }, -- Select inside class
	{ "aa", "@parameter.outer" }, -- Select outside parameter
	{ "ia", "@parameter.inner" }, -- Select inside parameter
}

-- Define select text object key mappings
for _, keymap in ipairs(keymaps) do
	define_select(unpack(keymap))
end

-- Go to start of next function
vim.keymap.set({ "n", "x", "o" }, "]m", function()
	move.goto_next_start("@function.outer", "textobjects")
end)
-- Go to start of next class
vim.keymap.set({ "n", "x", "o" }, "]]", function()
	move.goto_next_start("@class.outer", "textobjects")
end)
-- Go to start of next parameter
vim.keymap.set({ "n", "x", "o" }, "]a", function()
	move.goto_next_start("@parameter.inner", "textobjects")
end)
-- Go to end of next function
vim.keymap.set({ "n", "x", "o" }, "]M", function()
	move.goto_next_end("@function.outer", "textobjects")
end)
-- Go to end of next class
vim.keymap.set({ "n", "x", "o" }, "][", function()
	move.goto_next_end("@class.outer", "textobjects")
end)
-- Go to end of next parameter
vim.keymap.set({ "n", "x", "o" }, "]A", function()
	move.goto_next_end("@parameter.inner", "textobjects")
end)
-- Go to start of previous function
vim.keymap.set({ "n", "x", "o" }, "[m", function()
	move.goto_previous_start("@function.outer", "textobjects")
end)
-- Go to start of previous class
vim.keymap.set({ "n", "x", "o" }, "[[", function()
	move.goto_previous_start("@class.outer", "textobjects")
end)
-- Go to start of previous parameter
vim.keymap.set({ "n", "x", "o" }, "[a", function()
	move.goto_previous_start("@parameter.inner", "textobjects")
end)
-- Go to end of previous function
vim.keymap.set({ "n", "x", "o" }, "[M", function()
	move.goto_previous_end("@function.outer", "textobjects")
end)
-- Go to end of previous class
vim.keymap.set({ "n", "x", "o" }, "[]", function()
	move.goto_previous_end("@class.outer", "textobjects")
end)
-- Go to end of previous parameter
vim.keymap.set({ "n", "x", "o" }, "[A", function()
	move.goto_previous_end("@parameter.inner", "textobjects")
end)

local filetypes = {}
for _, filetype in ipairs(require("nvim-treesitter").get_installed()) do
	table.insert(filetypes, filetype)
end
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("my-treesitter-highlight", {}),
	pattern = filetypes,
	callback = function()
		vim.treesitter.start() -- Enable syntax highlighting
		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()" -- Enable indentation
	end,
})

return {}
