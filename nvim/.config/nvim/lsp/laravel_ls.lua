---@brief
---
--- https://github.com/laravel-ls/laravel-ls
---
--- `laravel-ls`, language server for laravel
---
--- The default `cmd` assumes that the `laravel-ls` binary can be found in `$PATH`.

---@type vim.lsp.Config
return {
	cmd = { "laravel-ls" },
	filetypes = { "php", "blade" },
	root_markers = { "artisan" },
    -- Added this because it was still attaching to non Laravel projects
	root_dir = function(bufnr, on_dir)
		local fname = vim.api.nvim_buf_get_name(bufnr)
		local root = vim.fs.root(fname, { "artisan" })
		if root then
			on_dir(root)
		end
		-- if no artisan found, don't call on_dir → server won't attach
	end,
}
