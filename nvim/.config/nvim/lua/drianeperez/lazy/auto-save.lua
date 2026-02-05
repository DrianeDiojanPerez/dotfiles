return {
    "okuuva/auto-save.nvim",
    config = function()
        require("auto-save").setup {
            enabled = true, -- start auto-save when the plugin is loaded (i.e. when your package manager loads it)
            trigger_events = { -- See :h events
                immediate_save = { "FocusLost" }, -- vim events that trigger an immediate save
                defer_save = { "InsertLeave", "TextChanged" }, -- vim events that trigger a deferred save (saves after `debounce_delay`)
                cancel_deferred_save = { "InsertEnter", "CompleteChanged", "BufLeave" }, -- vim events that cancel a pending deferred save
            },
            condition = function(buf)
                local fn = vim.fn
                if vim.bo[buf].filetype == "harpoon" then
                    return false
                end
                local utils = require("auto-save.utils.data")
                if
                    fn.getbufvar(buf, "&modifiable") == 1 and
                    vim.api.nvim_buf_is_valid(buf) and
                    utils.not_in(fn.getbufvar(buf, "&filetype"), {}) then
                    return true -- met condition(s), can save
                end
                return false -- can't save
            end,
            write_all_buffers = false, -- Write all buffers when the current one meets `condition`
            noautocmd = false, -- Do not execute autocmds when saving
            debounce_delay = 1200, -- Delay after which a pending save is executed
            -- log debug messages to 'auto-save.log' file in neovim cache directory, set to `true` to enable
            debug = false,
        }

        local group = vim.api.nvim_create_augroup('autosave', {})

        vim.api.nvim_create_autocmd('User', {
            pattern = 'AutoSaveWritePost',
            group = group,
            callback = function(opts)
                if opts.data.saved_buffer ~= nil then
                    print('AutoSave: saved at ' .. vim.fn.strftime('%H:%M:%S'))
                end
            end,
        })
    end,
}
