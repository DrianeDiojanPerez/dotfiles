return{
    "olexsmir/gopher.nvim",
    build = function ()
        vim.cmd [[silent! GoInstallDeps]]
    end,
    config = function()
        require("gopher").setup {
            commands = {
                go = "go",
                gomodifytags = "gomodifytags",
                gotests = "~/go/bin/gotests", -- also you can set custom command path
                impl = "impl",
                iferr = "iferr",
            },
        }

        vim.keymap.set("n", "<leader>ga", "<cmd> GoTagAdd json <CR>")
        vim.keymap.set(
            "n",
            "<leader>ge",
            "oif err != nil {<CR>}<Esc>Oreturn err<Esc>"
        )
    end
}
