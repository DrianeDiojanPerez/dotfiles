return {
    "tpope/vim-commentary",
    config = function()
        vim.keymap.set("n", "<leader>/", ":Commentary<cr>", { noremap = true })
        vim.keymap.set("v", "<leader>/", ":Commentary<cr>", { noremap = true })
    end
}
