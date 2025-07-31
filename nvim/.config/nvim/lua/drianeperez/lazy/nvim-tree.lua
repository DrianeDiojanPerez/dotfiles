return {
    "nvim-tree/nvim-tree.lua",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()

        local function my_on_attach(bufnr)
            local api = require("nvim-tree.api")

            local function opts(desc)
                return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
            end

            -- default mappings
            -- api.config.mappings.default_on_attach(bufnr)

            -- custom mappings
            vim.keymap.set("n", "%",              api.fs.create,                      opts("Create File Or Directory"))
            vim.keymap.set("n", "d",              api.fs.create,                      opts("Create File Or Directory"))
            vim.keymap.set("n", "R",              api.fs.rename_full,                 opts("Rename: Full Path"))
            vim.keymap.set("n", "D",              api.fs.remove,                      opts("Delete"))
            vim.keymap.set("n", "<CR>",           api.node.open.edit,                 opts("Open"))
            vim.keymap.set("n", "<Tab>",          api.node.open.preview,              opts("Open Preview"))
            vim.keymap.set("n", "W",              api.tree.collapse_all,              opts("Collapse"))
            vim.keymap.set("n", "g?", api.tree.toggle_help, opts("Help"))
        end

        local nvimtree = require("nvim-tree")

        -- recommended settings from nvim-tree documentation
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        nvimtree.setup({
            on_attach = my_on_attach,
            view = {
                width = 45,
                relativenumber = true,
            },
            -- change folder arrow icons
            renderer = {
                indent_markers = {
                    enable = true,
                },
                icons = {
                    glyphs = {
                        folder = {
                            arrow_closed = ">", -- arrow when folder is closed 󰥭
                            arrow_open = "", -- arrow when folder is open 
                        },
                    },
                },
            },
            -- disable window_picker for
            -- explorer to work well with
            -- window splits
            actions = {
                open_file = {
                    window_picker = {
                        enable = false,
                    },
                },
            },
            filters = {
                custom = { ".DS_Store" },
            },
            git = {
                ignore = false,
            },
            update_focused_file = {
                enable = true,
            },
        })

        -- set keymaps
        local keymap = vim.keymap -- for conciseness

        keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
        keymap.set("n", "<leader>nf", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" }) -- toggle file explorer on current file
        keymap.set("n", "<leader>nc", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" }) -- collapse file explorer
        keymap.set("n", "<leader>nr", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" }) -- refresh file explorer
    end,
}
