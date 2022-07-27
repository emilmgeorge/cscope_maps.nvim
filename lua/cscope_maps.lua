------------------------------------
-- CSCOPE settings for nvim in lua
------------------------------------

if io.open("cscope.out", "r") ~= nil then
	-- use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
	vim.opt.cscopetag = true
	-- check cscope for definition of a symbol before checking ctags: set to 1
	-- if you want the reverse search order.
	vim.opt.csto = 0
	-- show msg when cscope db added
	vim.opt.cscopeverbose = true
	-- results in quickfix window
	vim.opt.cscopequickfix = "s-,g-,c-,t-,e-,f-,i-,d-,a-"
	-- add cscope database in current directory
	vim.cmd("cs add cscope.out")

	-- define key table for input strings
	local sym_map = {
		["s"] = "Find this symbol",
		["g"] = "Find this global defination",
		["c"] = "Find functions calling this function",
		["t"] = "Find this text string",
		["e"] = "Find this egrep pattern",
		["f"] = "Find this file",
		["i"] = "Find files #including this file",
		["d"] = "Find functions called by this function",
		["a"] = "Find places where this symbol is assigned a value",
	}

	-- function to print xcscpoe.el like prompts
	cscope_search = function(operation, default_symbol)
		local new_symbol = vim.fn.input(sym_map[operation] .. " (default: '" .. default_symbol .. "'): ")
		if "" ~= new_symbol then
			vim.cmd(":cs find " .. operation .. " " .. new_symbol)
		else
			vim.cmd(":cs find " .. operation .. " " .. default_symbol)
		end
		vim.cmd("copen")
	end

	-- Mappings
	local ok, wk = pcall(require, "which-key")
	local opts = { noremap = true, silent = true }
	if not ok then
		--Add leader shortcuts
		vim.api.nvim_set_keymap("n", "<C-\\>s", [[<cmd>lua cscope_search('s', vim.fn.expand("<cword>"))<cr>]], opts)
		vim.api.nvim_set_keymap("n", "<C-\\>g", [[<cmd>lua cscope_search('g', vim.fn.expand("<cword>"))<cr>]], opts)
		vim.api.nvim_set_keymap("n", "<C-\\>c", [[<cmd>lua cscope_search('c', vim.fn.expand("<cword>"))<cr>]], opts)
		vim.api.nvim_set_keymap("n", "<C-\\>t", [[<cmd>lua cscope_search('t', vim.fn.expand("<cword>"))<cr>]], opts)
		vim.api.nvim_set_keymap("n", "<C-\\>e", [[<cmd>lua cscope_search('e', vim.fn.expand("<cword>"))<cr>]], opts)
		vim.api.nvim_set_keymap("n", "<C-\\>f", [[<cmd>lua cscope_search('f', vim.fn.expand("<cfile>"))<cr>]], opts)
		vim.api.nvim_set_keymap("n", "<C-\\>i", [[<cmd>lua cscope_search('i', vim.fn.expand("<cfile>"))<cr>]], opts)
		vim.api.nvim_set_keymap("n", "<C-\\>d", [[<cmd>lua cscope_search('d', vim.fn.expand("<cword>"))<cr>]], opts)
		vim.api.nvim_set_keymap("n", "<C-\\>a", [[<cmd>lua cscope_search('a', vim.fn.expand("<cword>"))<cr>]], opts)
	else
		-- which-key mappings
		--Add leader shortcuts
		wk.register({
			["<C-\\>"] = {
				name = "+cscope",
				s = { "<cmd>lua cscope_search('s', vim.fn.expand('<cword>'))<cr>", sym_map["s"] },
				g = { "<cmd>lua cscope_search('g', vim.fn.expand('<cword>'))<cr>", sym_map["g"] },
				c = { "<cmd>lua cscope_search('c', vim.fn.expand('<cword>'))<cr>", sym_map["c"] },
				t = { "<cmd>lua cscope_search('t', vim.fn.expand('<cword>'))<cr>", sym_map["t"] },
				e = { "<cmd>lua cscope_search('e', vim.fn.expand('<cword>'))<cr>", sym_map["e"] },
				f = { "<cmd>lua cscope_search('f', vim.fn.expand('<cfile>'))<cr>", sym_map["f"] },
				i = { "<cmd>lua cscope_search('i', vim.fn.expand('<cfile>'))<cr>", sym_map["i"] },
				d = { "<cmd>lua cscope_search('d', vim.fn.expand('<cword>'))<cr>", sym_map["d"] },
				a = { "<cmd>lua cscope_search('a', vim.fn.expand('<cword>'))<cr>", sym_map["a"] },
			},
		}, opts)
	end
end
