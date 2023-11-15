return {
	-- { "folke/flash.nvim", enabled = false },
	{
		"ggandor/leap.nvim",
		config = function(_, opts)
			local leap = require("leap")
			for k, v in pairs(opts) do
				leap.opts[k] = v
			end
			leap.add_default_mappings(true)
		end,
	},
	{
		"ggandor/flit.nvim",
		opts = {
			-- default in lazyvim = "nx"
			-- default in flit.nvim = "v"
			labeled_modes = "nx",
			multiline = true,
		},
	},
}

