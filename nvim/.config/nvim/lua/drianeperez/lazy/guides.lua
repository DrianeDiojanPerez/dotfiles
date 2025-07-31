return {
    "lukas-reineke/indent-blankline.nvim",
    config = function()

        vim.api.nvim_set_hl(0, 'guides', {  fg = "#514B7A" })
        vim.api.nvim_set_hl(0, 'guidesNormal', {  fg = "#39364b" })

        require("ibl").setup {
            whitespace = {
                remove_blankline_trail = false,
            },
            scope = {
                highlight = "guides",
                enabled = true,
                show_start = false,
                show_end = false,
            },
            indent = { highlight = "guidesNormal"},
        }
    end
}
