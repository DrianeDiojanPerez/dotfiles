vim.g.mapleader = " "
-- vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
-- vim.g.mapleader = " "
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

local MAP = 2

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")

-- vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-d>", function ()
local height = vim.api.nvim_win_get_height(0)
    local jump = math.floor(height / MAP)
    vim.cmd("normal! " .. jump .. "jzz")
end)

vim.keymap.set("v", "<C-d>", function ()
local height = vim.api.nvim_win_get_height(0)
    local jump = math.floor(height / MAP)
    vim.cmd("normal! " .. jump .. "jzz")
end)

-- vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-u>", function ()
local height = vim.api.nvim_win_get_height(0)
    local jump = math.floor(height / MAP)
    vim.cmd("normal! " .. jump .. "kzz")
end)

vim.keymap.set("v", "<C-u>", function ()
local height = vim.api.nvim_win_get_height(0)
    local jump = math.floor(height / MAP)
    vim.cmd("normal! " .. jump .. "kzz")
end)

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>vwm", function()
    require("vim-with-me").StartVimWithMe()
end)
-- vim.keymap.set("n", "<leader>svwm", function()
--     require("vim-with-me").StopVimWithMe()
-- end)

-- Greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- This is going to get me canceled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
-- vim.keymap.set('n', '<C-f>', ':silent !tmux neww tmux-sessionizer<CR>')
-- vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-a>", "ggVG")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>wr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>Wr", [[:%s/\<<C-r><C-W>\>/<C-r><C-W>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>");
-- vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

-- auto save
 vim.keymap.set("n", "<leader>n", ":ASToggle<CR>", {})
vim.keymap.set("n", "<leader>i", "<cmd>.cc<CR>", {})

vim.diagnostic.config({
    update_in_insert = true,
    float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
    },
    -- Use the default configuration

    virtual_text = true,
    -- virtual_lines = false,

    -- Alternatively, customize specific options
    virtual_lines = {
        -- Only show virtual line diagnostics for the current cursor line
        current_line = true,
    },
})
