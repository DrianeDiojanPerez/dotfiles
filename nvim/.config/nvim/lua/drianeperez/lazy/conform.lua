return {
	"stevearc/conform.nvim",
	opts = function()
		local conform = require("conform")
		local util = require("conform.util")

		conform.setup({
			format = {
				timeout_ms = 3000,
				async = false, -- not recommended to change
				quiet = false, -- not recommended to change
			},
			formatters_by_ft = {
				lua = { "stylua" },
				fish = { "fish_indent" },
				sh = { "shfmt" },
				php = { "pint" },
				blade = { "blade-formatter" },
				go = { "gofmt" },
                astro = { "prettierd" },
				-- python = { "black" },
				-- javascript = { "prettierd" },
			},
			formatters = {
				injected = { options = { ignore_errors = true } },
				pint = {
					meta = {
						url = "https://github.com/laravel/pint",
						description = "Laravel Pint is an opinionated PHP code style fixer for minimalists. Pint is built on top of PHP-CS-Fixer and makes it simple to ensure that your code style stays clean and consistent.",
					},
					command = util.find_executable({
						vim.fn.stdpath("data") .. "/mason/bin/pint",
						"vendor/bin/pint",
					}, "pint"),
					args = { "$FILENAME" },
					stdin = false,
				},
			},
		})

        vim.keymap.set({ "n", "v" }, "<leader>=", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
