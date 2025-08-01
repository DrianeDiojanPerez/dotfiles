return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local todo_comments = require("todo-comments")

        -- set keymaps
        local keymap = vim.keymap -- for conciseness

        keymap.set("n", "<leader>cn", function()
            todo_comments.jump_next()
        end, { desc = "Next todo comment" })

        keymap.set("n", "<leader>cp", function()
            todo_comments.jump_prev()
        end, { desc = "Previous todo comment" })

        todo_comments.setup()
    end,
}
