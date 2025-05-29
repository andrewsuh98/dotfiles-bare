return {
	-- slime (REPL integration)
	"jpalardy/vim-slime",
	lazy = false,

	-- init = function()
	--        vim.g.slime_no_mappings = 1
	-- end,

	-- keys = {
	-- 	{ "<leader>rc", "<cmd>SlimeConfig<cr>", desc = "Slime Config" },
	-- 	{ "<leader>rr", "<Plug>SlimeSendCell<BAR>/^# %%<CR>", desc = "Slime Send Cell" },
	-- 	{ "<leader>rr", ":<C-u>'<,'>SlimeSend<CR>", mode = "v", desc = "Slime Send Selection" },
	-- },

	config = function()
		vim.g.slime_target = "tmux"
		vim.g.slime_default_config = {
			socket_name = "default",
			target_pane = "{last}",
		}
		-- vim.g.slime_cell_delimiter = "# %%"
		vim.g.slime_bracketed_paste = 1
	end,
}
