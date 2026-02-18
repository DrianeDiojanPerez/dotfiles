return {
	-- ── ThePrimeagen's git-worktree ──────────────────────────
	{
		"ThePrimeagen/git-worktree.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
		},
		-- Load on these keys so startup stays fast
		keys = {
			{ "<leader>gwl", desc = "Worktree: list/switch" },
			{ "<leader>gwc", desc = "Worktree: create" },
			{ "<leader>gwp", desc = "Worktree: switch previous" },
			{ "<leader>gwd", desc = "Worktree: delete current" },
			{ "<leader>gwf", desc = "Worktree: find file in worktree" },
			{ "<leader>gwi", desc = "Worktree: info" },
		},
		config = function()
			-- Pull in both config files (place them in lua/)
			require("git-worktree").setup({
				change_directory_command = "cd", -- default: "cd",
				update_on_change = true, -- default: true,
				update_on_change_command = "e .", -- default: "e .",
				clearjumps_on_change = true, -- default: true,
				autopush = false, -- default: false,
			})
		end,
	},
}
