return {
    {
        "tzachar/local-highlight.nvim",
        config = function()
            vim.api.nvim_set_hl(0, 'currentCursorHighlight', {  bg = "#484848" })
            vim.api.nvim_set_hl(0, 'matchHighlight', { bg = "#484848", bold = true })
            -- #ffffff

            require('local-highlight').setup({
                hlgroup = 'matchHighlight',
                cw_hlgroup = 'currentCursorHighlight',
                highlight_single_match = false,
                delay = 400,
            })
        end
    },
    -- {
    --     "uga-rosa/ccc.nvim",
    --     config = function()
    --         require("ccc").setup({
    --             highlighter = {
    --                 auto_enable = true,
    --                 lsp = true,
    --             },
    --         })
    --     end
    -- }
    {
        "NvChad/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end
    }
}
