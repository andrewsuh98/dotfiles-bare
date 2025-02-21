return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		defaults = {
			sorting_strategy = "ascending",
			path_display = { "truncate" },
			layout_config = {
				horizontal = {
					prompt_position = "top",
				},
			},
			-- other layout configuration here
		},
		-- other defaults configuration here
	},
	-- other configuration values here
}
