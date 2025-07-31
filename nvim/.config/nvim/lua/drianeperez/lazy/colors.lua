function ColorMyPencils()
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1f1d2e" })
	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	vim.api.nvim_set_hl(0, "Folded", { bg = "#2a273f" })
	vim.api.nvim_set_hl(0, "Pmenu", { bg = "#1f1d2e" })
	vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#26233a" })
	vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = "none", fg = "none" })
	vim.api.nvim_set_hl(0, "StatusLineHeader", { bg = "none", fg = "none" })
	vim.api.nvim_set_hl(0, "StatusLineHeaderModified", { bg = "none", fg = "none" })

     -- StatusLineHeader = { fg = c_jeans, bg = c_pigeon },
  -- StatusLineHeaderModified = { fg = c_jeans, bg = c_ochre },
end
return{
    {
        "folke/tokyonight.nvim",
        config = function()
            require("tokyonight").setup({
                style = "storm",
                transparent = true,
                terminal_colors = true,
                styles = {
                    comments = { italic = false },
                    keywords = { italic =  false },
                    sidebars = "dark",
                    floats = "dark",
                }
            })
        end
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require("rose-pine").setup({
                disable_background = true,
                disable_float_background = true,
            })
            vim.cmd("colorscheme rose-pine")
            ColorMyPencils()
        end
    },
    -- {
    --     "itchyny/lightline.vim",
    --     config =function ()
    --         vim.g.lightline = {
    --             colorscheme = 'one',
    --             active = {
    --                 left = {
    --                     { 'mode', 'paste' },
    --                     { 'gitbranch', 'readonly', 'filename', 'modified' }
    --                 }
    --             },
    --             component_function = {
    --                 gitbranch = 'FugitiveHead'
    --             }
    --         }


    --     end
    -- }
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function ()

            require('lualine').setup {
                options = {
                    icons_enabled = true,
                    theme = 'palenight',
                    component_separators = { left = '', right = ' '},
                    section_separators = { left = '', right = ''},
                    disabled_filetypes = {
                        statusline = {},
                        winbar = {},
                    },
                    ignore_focus = {},
                    always_divide_middle = true,
                    globalstatus = false,
                    refresh = {
                        statusline = 1000,
                        tabline = 1000,
                        winbar = 1000,
                    }
                },
                sections = {
                    lualine_a = {'mode'},
                    lualine_b = {'branch', 'diff', 'diagnostics'},
                    lualine_c = {'filename'},
                    lualine_x = {'encoding', 'fileformat', 'filetype'},
                    lualine_y = {'progress'},
                    lualine_z = {'location'}
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = {'filename'},
                    lualine_x = {'location'},
                    lualine_y = {},
                    lualine_z = {}
                },
                tabline = {},
                winbar = {},
                inactive_winbar = {},
                extensions = {}
            }

        end
    }
}
