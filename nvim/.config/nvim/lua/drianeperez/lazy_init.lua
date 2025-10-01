local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = "drianeperez.lazy",
	change_detection = { notify = false },
})

-- vim.api.nvim_create_autocmd("LspAttach", {
-- 	callback = function(args)
-- 		local client = vim.lsp.get_client_by_id(args.data.client_id)
-- 		if client and client.name == "rust_analyzer" then
-- 			vim.defer_fn(function()
-- 				vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
-- 			end, 500)
-- 		end
-- 	end,
-- })
--

-- vim.api.nvim_create_autocmd("LspProgress", {
-- 	callback = function(ev)
--         -- vim.notify("nvim-lsp-installer is starting...", vim.log.levels.INFO)
--         -- print("AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"))
-- 		local value = ev.data.params.value
-- 		if value.kind == "begin" then
-- 			print("\027]9;4;1;0\027\\")
-- 		elseif value.kind == "end" then

-- 			print("finishing")
-- 			-- vim.api.nvim_ui_send("\027]9;4;0\027\\")
-- 		elseif value.kind == "report" then

-- 			print(string.format("\027]9;4;1;%d\027\\", value.percentage or 0))
-- 			-- vim.api.nvim_ui_send(string.format("\027]9;4;1;%d\027\\", value.percentage or 0))
-- 		end
-- 	end,
-- })
--
-- After your lspconfig setup, add this autocmd
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "rust",
--   callback = function()
--     vim.lsp.start({
--       name = "tailwindcss",
--       cmd = { "tailwindcss-language-server", "--stdio" },
--       root_dir = vim.fs.dirname(vim.fs.find({"tailwind.config.js", "Cargo.toml"}, { upward = true })[1]),
--       init_options = {
--         userLanguages = {
--           rust = "html",
--         },
--       },
--       settings = {
--         tailwindCSS = {
--           includeLanguages = {
--             rust = "html",
--           },
--           experimental = {
--             classRegex = {
--               [[class:\s*"([^"]*)"]],
--               'class:\\s*"([^"]*)"',
--             },
--           },
--         },
--       },
--     })
--   end,
-- })
