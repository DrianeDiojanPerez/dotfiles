return {

	"neovim/nvim-lspconfig",
    -- "hrsh7th/cmp-buffer",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		-- "neovim/nvim-lspconfig",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		-- "j-hui/fidget.nvim",
		"brenoprata10/nvim-highlight-colors",
		"onsails/lspkind.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local cmp_lsp = require("cmp_nvim_lsp")
		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			cmp_lsp.default_capabilities()
		)
			-- require("fidget").setup({
			-- 	notification = {
			-- 		window = {
			-- 			winblend = 0,
			-- 		},
			-- 	},
			-- })
		require("mason").setup({})
		require("mason-lspconfig").setup({

			ensure_installed = {
				"astro",
				"gopls",
				"lua_ls",
				"rust_analyzer",
				"intelephense",
				"phpactor",
				"html",
				"htmx",
				-- "psalm",
				-- "biome",
				"vtsls",
				"tailwindcss",
				"sqlls",
			},
			handlers = {
				function(servername)
					--                     require("lspconfig")[servername].setup({
					--                         capabilities = capabilities
					--                     })
					-- ////// GO TEMPL ////// --

					--                     local custom_format = function()
					--                         if vim.bo.filetype == "templ" then
					--                             local bufnr = vim.api.nvim_get_current_buf()
					--                             local filename = vim.api.nvim_buf_get_name(bufnr)
					--                             local cmd = "templ fmt " .. vim.fn.shellescape(filename)

					--                             vim.fn.jobstart(cmd, {
					--                                 on_exit = function()
					--                                     -- Reload the buffer only if it's still the current buffer
					--                                     if vim.api.nvim_get_current_buf() == bufnr then
					--                                         vim.cmd('e!')
					--                                     end
					--                                 end,
					--                             })
					--                         else
					--                             vim.lsp.buf.format({
					--                                 {
					--                                     range = {
					--                                         ["start"] = vim.api.nvim_buf_get_mark(0, "<"),
					--                                         ["end"] = vim.api.nvim_buf_get_mark(0, ">"),
					--                                     }
					--                                 }
					--                             })
					--                         end
					--                     end

					--                     local on_attach = function(_, bufnr)
					--                         local opts = { buffer = bufnr, remap = false }
					--                         -- Other configuration options
					--                         vim.keymap.set("v", "<leader>=", custom_format, opts)
					--                         vim.keymap.set("n", "<leader>=", custom_format, opts)
					--                     end

					vim.filetype.add({ extension = { templ = "templ" } })

					-- local lspconfig = require("lspconfig")

					--                     lspconfig.gopls.setup({
					--                         on_attach = on_attach,
					--                         capabilities = capabilities,
					--                         cmd = { "gopls" },
					--                         filetypes = { "go", "gomod", "gowork", "gotmpl", "templ" },
					--                         settings = {
					--                             gopls = {
					--                                 completeUnimported = true,
					--                                 usePlaceholders = true,
					--                                  templateExtensions = {"templ"},
					--                             }
					--                         }

					--                     })

					-- lspconfig.psalm.setup({
					--     filetypes = { 'php' },
					--     root_dir = require('lspconfig.util').root_pattern('psalm.xml', 'psalm.xml.dist', 'composer.json', '.git'),
					-- })

					-- lspconfig.psalm.setup({
					--     cmd = { 'psalm', '--language-server' },
					--     filetypes = { 'php' },
					--     root_dir = require('lspconfig.util').root_pattern('psalm.xml', 'psalm.xml.dist', 'composer.json'),
					-- })

					-- lspconfig.html.setup({
					--     on_attach = on_attach,
					--     capabilities = capabilities,
					--     filetypes = { "html", "templ", "blade" },
					-- })

					-- lspconfig.htmx.setup({
					--     on_attach = on_attach,
					--     capabilities = capabilities,
					--     filetypes = { "html", "templ", "blade" },
					-- })

					-- lspconfig.tailwindcss.setup({
					--     on_attach = on_attach,
					--     capabilities = capabilities,
					--     filetypes = { "templ", "astro", "javascript", "typescript", "react", "blade" },
					--     init_options = { userLanguages = { templ = "html" } },
					-- })

					--                     lsp_config.golangcilsp = {
					--                         default_config = {
					--                             cmd = {'golangci-lint-langserver'},
					--                             root_dir = lspconfig.util.root_pattern('.git', 'go.mod'),
					--                             init_options = {
					--                                 command = { "golangci-lint", "run", "--out-format", "json", "--issues-exit-code=1" };
					--                             }
					--                         };
					--                     }

					-- lspconfig.golangci_lint_ls.setup {
					--     filetypes = {'go','gomod'},
					--     cmd = {"golangci-lint", "run", "--out-format", "json", "--issues-exit-code=1" }
					--     -- golangci-lint run --out-format=json --show-stats=false --issues-exit-code=1
					--     -- cmd = {"golangci-lint", "run", "--out-format=json", "--show-stats=false", "--issues-exit-code=1" };
					--     -- command = { "golangci-lint", "run", "--out-format", "json", "--issues-exit-code=1" };

					-- }

					-- //// END GO TEMPL //// --
					-- //// VUE //// --

					--                     lspconfig.volar.setup {
					--                         filetypes = {
					--                             'typescript',
					--                             'javascript',
					--                             -- 'javascriptreact',
					--                             'vue' },
					--                         init_options = {
					--                             vue = {
					--                                 hybridMode = false,
					--                             },
					--                         },
					--                     }

					-- lspconfig.phpactor.setup({
					--     on_attach = on_attach,
					--     capabilities = capabilities,
					--     filetypes = { "php", "blade" },
					--     init_options = {
					--         ["language_server_phpstan.enabled"] = true,
					--         ["language_server_phpstan.level"] = "8",
					--     },
					-- })

					--                     lspconfig.denols.setup({
					--                         on_attach = on_attach,
					--                         capabilities = capabilities,
					--                         filetypes = { "javascript" },
					--                         init_options = {
					--                             ["language_server_phpstan.enabled"] = true,
					--                             ["language_server_phpstan.level"] = "8",
					--                         },
					--                     })

					-- lspconfig.harper_ls.setup {
					--     settings = {
					--         ["harper-ls"] = {
					--             linters = {
					--                 LongSentences = false,
					--             },
					--             userDictPath = vim.fn.stdpath("config") .. "/spell/en.utf-8.add", }
					--     },
					-- }
				end,
			},
		})
		local mason_tool_installer = require("mason-tool-installer")

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"isort", -- python formatter
				"black", -- python formatter
				"pylint",
				"eslint_d",
				"gopls",
				"stylua",
				"shellcheck",
				"editorconfig-checker",
				"gofumpt",
				"golines",
				"gomodifytags",
				"gotests",
				"impl",
				"json-to-struct",
				"misspell",
				"revive",
				"shellcheck",
				"shfmt",
				"staticcheck",
				"vint",
			},
		})

		local cmp = require("cmp")
		local cmp_select = { behavior = cmp.SelectBehavior.Select }

		-- `/` cmdline setup.
		cmp.setup.cmdline("/", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})

		-- `:` cmdline setup.
		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{
					name = "cmdline",
					option = {
						ignore_cmds = { "Man", "!" },
					},
				},
			}),
		})

		-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1e1e2e", fg = "#c0caf5" }) -- Change background & text color
		vim.api.nvim_set_hl(0, "CmpDocumentation", { bg = "#1e1e2e", fg = "#c0caf5" }) -- Ensure cmp doc has correct color
		vim.api.nvim_set_hl(0, "CmpDocumentationBorder", { bg = "#1e1e2e", fg = "#7aa2f7" }) -- Ensure cmp border color

		cmp.setup({
			window = {
				documentation = cmp.config.window.bordered({
					-- border = "rounded",
					winhighlight = "Normal:CmpDocumentation,FloatBorder:CmpDocumentationBorder",
				}),
			},
			formatting = {
				format = function(entry, item)
					local color_item = require("nvim-highlight-colors").format(entry, { kind = item.kind })
					item = require("lspkind").cmp_format({
						mode = "symbol_text", -- show only symbol annotations
						maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
						ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
						show_labelDetails = true, -- show labelDetails in menu. Disabled by default
						symbol_map = {
							Supermaven = "",
							Text = "󰉿",
							Method = "󰆧",
							Function = "󰊕",
							Constructor = "",
							Field = "󰜢",
							Variable = "󰀫",
							Class = "󰠱",
							Interface = "",
							Module = "",
							Property = "󰜢",
							Unit = "󰑭",
							Value = "󰎠",
							Enum = "",
							Keyword = "󰌋",
							Snippet = "",
							Color = "󰏘",
							File = "󰈙",
							Reference = "󰈇",
							Folder = "󰉋",
							EnumMember = "",
							Constant = "󰏿",
							Struct = "󰙅",
							Event = "",
							Operator = "󰆕",
							TypeParameter = "",
						},
						before = function(entry, vim_item)
							return vim_item
						end,
					})(entry, item)
					local tempVar = item.kind
					item.kind = item.abbr
					item.menu = tempVar
					if color_item.abbr_hl_group then
						item.abbr_hl_group = color_item.abbr_hl_group
						item.abbr = color_item.abbr
					else
						item.abbr = nil
					end
					-- item.menu = item.kind
					return item -- local color_item = require("nvim-highlight-colors").format(entry, { kind = item.kind })

					-- item = require('lspkind').cmp_format({
					--     mode = 'symbol_text', -- show only symbol annotations
					--     maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
					--     ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
					--     show_labelDetails = true, -- show labelDetails in menu. Disabled by default
					--     symbol_map = {
					--         Supermaven = "",
					--         Text = "󰉿",
					--         Method = "󰆧",
					--         Function = "󰊕",
					--         Constructor = "",
					--         Field = "󰜢",
					--         Variable = "󰀫",
					--         Class = "󰠱",
					--         Interface = "",
					--         Module = "",
					--         Property = "󰜢",
					--         Unit = "󰑭",
					--         Value = "󰎠",
					--         Enum = "",
					--         Keyword = "󰌋",
					--         Snippet = "",
					--         Color = "󰏘",
					--         File = "󰈙",
					--         Reference = "󰈇",
					--         Folder = "󰉋",
					--         EnumMember = "",
					--         Constant = "󰏿",
					--         Struct = "󰙅",
					--         Event = "",
					--         Operator = "󰆕",
					--         TypeParameter = "",
					--     },
					--     before = function (entry, vim_item)
					--         return vim_item
					--     end
					-- })(entry, item)
					-- if color_item.abbr_hl_group then
					--     item.kind_hl_group = color_item.abbr_hl_group
					--     item.kind = color_item.abbr
					-- end
					-- return item
				end,
			},
			snippet = {
				-- REQUIRED - you must specify a snippet engine
				expand = function(args)
					require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
				end,
			},
			mapping = cmp.mapping.preset.insert({

				["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
				["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
				["<C-y>"] = cmp.mapping.confirm({ select = true }),
				["<C-Space>"] = cmp.mapping.complete(),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
			}, {
				{ name = "buffer" },
				{ name = "path" },
			}),
		})
	end,
}
