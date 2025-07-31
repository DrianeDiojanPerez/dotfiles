return{
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function ()
        local ls = require("luasnip")
        ls.filetype_extend("typescript", { "tsdoc" })
        ls.filetype_extend("javascript", { "jsdoc" })
        ls.filetype_extend("lua", { "luadoc" })
        ls.filetype_extend("python", { "pydoc" })
        ls.filetype_extend("rust", { "rustdoc" })
        ls.filetype_extend("cs", { "csharpdoc" })
        ls.filetype_extend("java", { "javadoc" })
        ls.filetype_extend("c", { "cdoc" })
        ls.filetype_extend("cpp", { "cppdoc" })
        ls.filetype_extend("php", { "phpdoc" })
        ls.filetype_extend("kotlin", { "kdoc" })
        --require("luasnip").filetype_extend("ruby", { "rdoc" })
        ls.filetype_extend("sh", { "shelldoc" })
        vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
        vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump(1) end, {silent = true})
        vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})

        vim.keymap.set({"i", "s"}, "<C-E>", function()
            if ls.choice_active() then
                ls.change_choice(1)
            end
        end, {silent = true})
        require("luasnip.loaders.from_vscode").lazy_load()-- friendly-snippets - enable standardized comments snippets
    end
}
