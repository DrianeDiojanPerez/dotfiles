return {
	"folke/trouble.nvim",
	opts = {}, -- for default options, refer to the configuration section for custom setup.
	cmd = "Trouble",
	keys = {
		{
			"<leader>tt",
			"<cmd>Trouble diagnostics toggle<cr>",
			desc = "Diagnostics (Trouble)",
		},
	},
	config = function ()
        require("trouble").setup({})

	    vim.keymap.set("n", "<leader>tn", function()
	        require("trouble").next({ skip_groups = true, jump = true })
	    end)
	    vim.keymap.set("n", "<leader>tp", function()
	        require("trouble").previous({ skip_groups = true, jump = true })
	    end)

	end
}
