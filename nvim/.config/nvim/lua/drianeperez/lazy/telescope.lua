return {

	"nvim-telescope/telescope.nvim",
	-- tag = "0.1.5",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("telescope").setup({
			defaults = {
				-- Remove .config from ignored patterns
				file_ignore_patterns = {
					"node_modules",
					".git/",
					-- Don't include ".config" here
				},
				-- Show hidden files including .config
				hidden = true,
			},
			pickers = {
				find_files = {
					hidden = true,
					-- Don't respect .gitignore if .config is ignored there
					no_ignore = false,
					-- Or use no_ignore = true to ignore all ignore files
				},
				live_grep = {
					additional_args = function()
						return { "--hidden" }
					end,
				},
			},
		})

		-- require("telescope").load_extension("git_worktree")

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>f", builtin.find_files, {})
		-- vim.keymap.set("n", "<leader>g", builtin.git_files, {})

		vim.keymap.set("n", "<leader>ws", function()
			local word = vim.fn.expand("<cword>")
			builtin.grep_string({ search = word })
		end)
		vim.keymap.set("n", "<leader>wf", function()
			local word = vim.fn.expand("<cword>")
			builtin.find_files({ default_text = word })
		end)
		vim.keymap.set("n", "<leader>Wf", function()
			local word = vim.fn.expand("<cWORD>")
			builtin.find_files({ default_text = word })
		end)

		vim.keymap.set("n", "<leader>Ws", function()
			local word = vim.fn.expand("<cWORD>")
			builtin.grep_string({ search = word })
		end)

		-- vim.keymap.set('n', '<leader>s', function()
		--     builtin.grep_string({ search = vim.fn.input("Grep > ")});
		-- end)

		vim.keymap.set("n", "<leader>s", function()
			builtin.live_grep()
		end)

		vim.keymap.set("n", "<leader>vh", builtin.help_tags, {})

		-- -- List & switch worktrees  →  Telescope picker
		-- vim.keymap.set("n", "<leader>gw", function()
		-- 	require("telescope").extensions.git_worktree.git_worktrees()
		-- end)

		-- vim.keymap.set("n", "<leader>gwc", function()
            -- require('telescope').extensions.git_worktree.create_git_worktree()
		-- end)
	end,
}
