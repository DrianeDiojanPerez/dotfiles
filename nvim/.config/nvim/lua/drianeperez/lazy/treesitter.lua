return {

    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
        "nvim-treesitter/nvim-treesitter-refactor",
        -- "nvim-treesitter/nvim-tree-docs",
        "nvim-treesitter/playground",
    },
    build = ":TSUpdate",
    config = function()

        require('nvim-treesitter.configs').setup ({
            -- tree_docs = {enable = true},
            -- A list of parser names, or "all" (the five listed parsers should always be installed)
            ensure_installed = {
                "astro",
                "javascript",
                "typescript",
                "c",
                "lua",
                "vim",
                "vimdoc",
                "query",
                "php",
                "php_only",
                "html",
                "jsdoc",
            },

            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,

            -- Automatically install missing parsers when entering buffer
            -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
            auto_install = true,
            indent = {
                enable = true
            },
            highlight = {
                enable = true,

                -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                -- Using this option may slow down your editor, and you may see some duplicate highlights.
                -- Instead of true it can also be a list of languages
                additional_vim_regex_highlighting = { "markdown" },
            },
        })

        local treesitter_parser_config = require("nvim-treesitter.parsers").get_parser_configs()
        treesitter_parser_config.templ  = {
            install_info = {
                url = "https://github.com/vrischmann/tree-sitter-templ.git",
                files = {"src/parser.c","src/scanner.c"},
                branch = "master"
            }
        }

        treesitter_parser_config.blade = {
            install_info = {
                url = "https://github.com/EmranMR/tree-sitter-blade",
                files = {"src/parser.c"},
                branch = "main",
            },
            filetype = "blade"
        }
        vim.filetype.add({
            pattern = {
                ['.*%.blade%.php'] = 'blade',
            },
        })

        vim.treesitter.language.register('templ','templ')
    end

}
