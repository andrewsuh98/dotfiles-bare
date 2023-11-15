return {
	"williamboman/mason.nvim",
	opts = {
		ensure_installed = {
			-- shell
			"shellcheck", -- linter
			"shfmt", -- formatter

			-- lua
			"lua-language-server", -- LSP
			"stylua", -- formatter

			-- python
			"pyright", -- static type checker
			"debugpy", -- debugger
			"flake8", -- linter
			"black", -- formatter
		},
	},
}
