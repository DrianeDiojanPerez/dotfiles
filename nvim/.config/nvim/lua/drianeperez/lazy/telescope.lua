return {

    "nvim-telescope/telescope.nvim",
    -- tag = "0.1.5",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    config = function()
        require('telescope').setup({})
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>f', builtin.find_files, {})
        vim.keymap.set('n', '<leader>g', builtin.git_files, {})

        vim.keymap.set('n', '<leader>ws', function()
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({ search = word })
        end)
        vim.keymap.set('n', '<leader>wf', function()
            local word = vim.fn.expand("<cword>")
            builtin.find_files({ default_text = word })
        end)
        vim.keymap.set('n', '<leader>Wf', function()
            local word = vim.fn.expand("<cWORD>")
            builtin.find_files({ default_text = word })
        end)

        vim.keymap.set('n', '<leader>Ws', function()
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word })
        end)

        -- vim.keymap.set('n', '<leader>s', function()
        --     builtin.grep_string({ search = vim.fn.input("Grep > ")});
        -- end)

        vim.keymap.set('n', '<leader>s', function()
            builtin.live_grep();
        end)

        vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})

    end
}
