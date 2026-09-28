return {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local lint = require("lint")

        lint.linters_by_ft = {
            javascript = { "eslint_d", "oxlint" },
            typescript = { "eslint_d", "oxlint" },
            javascriptreact = { "eslint_d", "oxlint" },
            typescriptreact = { "eslint_d", "oxlint" },
            svelte = { "eslint_d" },
            python = { "pylint" },
            php = {
                -- "phpcs",
                "php",
                -- "phpmd",
                -- "phpinsights"
            },
        }

        local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

        -- oxlint lints with its defaults even when a project has no config, so
        -- it only runs where a config file opts the project in.
        local function linters_for_buffer()
            local names = lint.linters_by_ft[vim.bo.filetype] or {}
            local has_config = vim.fs.find(
                { ".oxlintrc.json", "oxlint.config.js", "oxlint.config.ts" },
                { upward = true, path = vim.fn.expand("%:p:h") }
            )[1]

            if has_config then
                return names
            end

            return vim.tbl_filter(function(name)
                return name ~= "oxlint"
            end, names)
        end

        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
            group = lint_augroup,
            callback = function()
                lint.try_lint(linters_for_buffer())
            end,
        })

        -- vim.keymap.set("n", "<leader>l", function()
        --   lint.try_lint()
        -- end, { desc = "Trigger linting for current file" })
    end,
}
