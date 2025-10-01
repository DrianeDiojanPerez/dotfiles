return {
	cmd = { "tailwindcss-language-server", "--stdio" },
	filetypes = {
		"aspnetcorerazor",
		"astro",
		"astro-markdown",
		"blade",
		"clojure",
		"django-html",
		"eruby", -- vim ft
		"gohtml",
		"gohtmltmpl",
		"haml",
		"handlebars",
		"hbs",
		"html",
		"htmlangular",
		"html-eex",
		"heex",
		"php",
		"razor",
		"slim",
		"twig",
		-- css
		"css",
		"less",
		"postcss",
		"sass",
		"scss",
		"stylus",
		"sugarss",
		-- js
		"javascript",
		"javascriptreact",
		"reason",
		"rescript",
		"typescript",
		"typescriptreact",
		-- mixed
		"vue",
		"svelte",
		"rust",
		"templ",
		"rs",
	},
	init_options = {
		userLanguages = {
			rust = "html", -- Treat Rust as HTML for class detection
		},
	},
	settings = {
		tailwindCSS = {
			-- validate = true,
			lint = {
				cssConflict = "warning",
				invalidApply = "error",
				invalidScreen = "error",
				invalidVariant = "error",
				invalidConfigPath = "error",
				invalidTailwindDirective = "error",
				recommendedVariantOrder = "warning",
			},
			classAttributes = {
				"class",
				"className",
				"class:list",
				"classList",
				"ngClass",
			},
			includeLanguages = {
				eelixir = "html-eex",
				elixir = "phoenix-heex",
				eruby = "erb",
				heex = "phoenix-heex",
				htmlangular = "html",
				templ = "html",
				rust = "html",
			},
			experimental = {
				classRegex = {
					-- For Rust macros or string literals with classes
					'class=\\"([^"]*)\\"',
					'class="([^"]*)"',
					'class: "([^"]*)"',
					'class:\\s*"([^"]*)"', -- class: "..."
					'class:\\s*"([^"]*)",', -- class: "...",
					[[class:\s*"([^"]*)"]], -- Alternative pattern
					[[class:\s*r#"([^"]*)"#]],
					[[class:\s*"([^"]*)"]],
					[[class:\s*'([^']*)']],
					[[class=\\"([^\\"]*)\\"]],
					[[class="([^"]*)"]],
					'class:\\s*"([^"]*)"',
					[[class:\s*"([^"]*)"]],
					'class:\\s*"([^"]*)"',
				},
			},
		},
	},
	before_init = function(_, config)
		if not config.settings then
			config.settings = {}
		end
		if not config.settings.editor then
			config.settings.editor = {}
		end
		if not config.settings.editor.tabSize then
			config.settings.editor.tabSize = vim.lsp.util.get_effective_tabstop()
		end
	end,
	root_dir = function(bufnr, on_dir)
		local root_files = {
			-- Generic
			"tailwind.config.js",
			"tailwind.config.cjs",
			"tailwind.config.mjs",
			"tailwind.config.ts",
			"postcss.config.js",
			"postcss.config.cjs",
			"postcss.config.mjs",
			"postcss.config.ts",
			-- Django
			"theme/static_src/tailwind.config.js",
			"theme/static_src/tailwind.config.cjs",
			"theme/static_src/tailwind.config.mjs",
			"theme/static_src/tailwind.config.ts",
			"theme/static_src/postcss.config.js",
			-- Fallback for tailwind v4, where tailwind.config.* is not required anymore
			".git",
			"Cargo.toml",
		}

		local fname = vim.api.nvim_buf_get_name(bufnr)
		-- Check package.json for tailwindcss dependency
		local package_json = vim.fs.find("package.json", { path = fname, upward = true })[1]
		if package_json then
			local ok, content = pcall(vim.fn.readfile, package_json)
			if ok then
				local json_str = table.concat(content, "\n")
				if json_str:match('"tailwindcss"') then
					table.insert(root_files, "package.json")
				end
			end
		end

		-- Check mix.lock and Gemfile.lock for "tailwind"
		for _, lockfile in ipairs({ "mix.lock", "Gemfile.lock" }) do
			local lock = vim.fs.find(lockfile, { path = fname, upward = true })[1]
			if lock then
				local ok, content = pcall(vim.fn.readfile, lock)
				if ok then
					local lock_str = table.concat(content, "\n")
					if lock_str:match("tailwind") then
						table.insert(root_files, lockfile)
					end
				end
			end
		end
		on_dir(vim.fs.dirname(vim.fs.find(root_files, { path = fname, upward = true })[1]))
	end,
}
