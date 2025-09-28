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
				javascript = { "eslint_d", "prettier" },
				javascriptreact = { "eslint_d", "prettier" },
				typescript = { "eslint_d", "prettier" },
				typescriptreact = { "eslint_d", "prettier" },
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
			prettier = {
				-- Remove prepend_args to let project config take precedence
				-- Or use conditional args
				prepend_args = function(self, ctx)
					-- Check if project has prettier config
					local has_config = vim.fs.find({
						".prettierrc",
						".prettierrc.json",
						".prettierrc.yml",
						".prettierrc.yaml",
						".prettierrc.js",
						".prettierrc.mjs", -- Added ES module support
						".prettierrc.cjs",
						"prettier.config.js",
						"prettier.config.mjs", -- Added ES module support
						"prettier.config.cjs",
					}, { upward = true, path = ctx.dirname })[1]

					print("Searching for Prettier configs...")

					if has_config then
						return {} -- Use project config
					else
						-- Fallback defaults
						return {
							"--single-quote",
							"--jsx-single-quote",
							"--trailing-comma",
							"es5",
						}
					end
				end,
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>=", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			}, function(err)

                end)
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
