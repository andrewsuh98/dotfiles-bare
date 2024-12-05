-- This plugin used to trigger insertion of "(" after autocomplete on method/function.
return {
	"windwp/nvim-autopairs",
	opts = {
		disable_filetype = { "TelescopePrompt", "vim" },
	},
}
