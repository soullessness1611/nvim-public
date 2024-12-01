-- LSP Support
return {
	-- LSP Configuration
	-- https://github.com/neovim/nvim-lspconfig
	"neovim/nvim-lspconfig",
	event = "BufWritePre", ---'VeryLazy',
	dependencies = {
		-- LSP Management
		-- https://github.com/williamboman/mason.nvim
		{ "williamboman/mason.nvim", opts = {} },
		-- https://github.com/williamboman/mason-lspconfig.nvim
		{ "williamboman/mason-lspconfig.nvim", opts = { automatic_installation = true } },

		-- Useful status updates for LSP
		-- https://github.com/j-hui/fidget.nvim
		{ "j-hui/fidget.nvim", opts = {} },

		-- Additional lua configuration, makes nvim stuff amazing!
		-- https://github.com/folke/neodev.nvim
		-- { 'folke/neodev.nvim', opts = {} },
		{ "b0o/schemastore.nvim" },
		{
			"ravibrock/spellwarn.nvim",
			event = "VeryLazy",
			config = true,
		},
	},
	config = function()
		local status, lsp_config = pcall(require, "lspconfig")
		if not status then
			return
		end

		local protocol = require("vim.lsp.protocol")

		-- local on_attach = function(client, bufnr)
		--   -- format on save
		--   if client.server_capabilities.documentFormattingProvider then
		--     vim.api.nvim_create_autocmd("BufWritePre", {
		--       group = vim.api.nvim_create_augroup("Format", { clear = true }),
		--       buffer = bufnr,
		--       callback = function() vim.lsp.buf.formatting_seq_sync() end
		--     })
		--   end
		-- end

		local on_attach = function(client, bufnr)
			local function buf_set_keymap(...)
				vim.api.nvim_buf_set_keymap(bufnr, ...)
			end
		end

		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		local on_attach_twcss = function(client)
			if client.server_capabilities.colorProvider then
				-- Attach document colour support
				require("document-color").buf_attach(bufnr)
			end
		end

		local capabilities_twcss = vim.lsp.protocol.make_client_capabilities()

		----------------------------------
		-- New JavaScript/TypeScript Setup
		----------------------------------
		lsp_config.ts_ls.setup({
			on_attach = on_attach,
			filetypes = {
				"typescript",
				"typescriptreact",
				"typescript.tsx",
				"javascript",
				"javascriptreact",
				"javascript.jsx",
			},
			cmd = { "typescript-language-server", "--stdio" },
		})

		------------
		-- Lua Setup
		------------
		-- WARN: This config load cpu (high cpu usage)
		-- lsp_config.lua_ls.setup {
		--     on_attach = on_attach,
		--     capabilities = capabilities,
		--     settings = {
		--         Lua = {
		--             runtime = {
		--                 version = "LuaJIT"
		--             },
		--             diagnotics = {
		--                 globals = {'vim'}
		--             },
		--             workspace = {
		--                 library = vim.api.nvim_get_runtime_file("", true),
		--                 checkThirdParty = false
		--             },
		--             telemetry = {
		--                 enable = false
		--             }
		--         }
		--     }
		-- }

		-- PERF: This is a workaround for the issue with the lua language server
		lsp_config.lua_ls.setup({
			-- enabled = false,
			single_file_support = true,
			settings = {
				Lua = {
					workspace = {
						checkThirdParty = false,
					},
					completion = {
						workspaceWord = true,
						callSnippet = "Both",
					},
					misc = {
						parameters = {
							-- "--log-level=trace",
						},
					},
					hint = {
						enable = true,
						setType = false,
						paramType = true,
						paramName = "Disable",
						semicolon = "Disable",
						arrayIndex = "Disable",
					},
					doc = {
						privateName = { "^_" },
					},
					type = {
						castNumberToInteger = true,
					},
					diagnostics = {
						disable = { "incomplete-signature-doc", "trailing-space" },
						-- enable = false,
						groupSeverity = {
							strong = "Warning",
							strict = "Warning",
						},
						groupFileStatus = {
							["ambiguity"] = "Opened",
							["await"] = "Opened",
							["codestyle"] = "None",
							["duplicate"] = "Opened",
							["global"] = "Opened",
							["luadoc"] = "Opened",
							["redefined"] = "Opened",
							["strict"] = "Opened",
							["strong"] = "Opened",
							["type-check"] = "Opened",
							["unbalanced"] = "Opened",
							["unused"] = "Opened",
						},
						unusedLocalExclude = { "_*" },
					},
					format = {
						enable = false,
						defaultConfig = {
							indent_style = "space",
							indent_size = "2",
							continuation_indent_size = "2",
						},
					},
				},
			},
		})

		-- lsp_config.lua_ls.setup({
		--     on_attach = on_attach,
		--     capabilities = capabilities,
		--     on_init = function(client)
		--         local path = client.workspace_folders[1].name  -- Neovim config dir
		--
		--         -- Debug common problems
		--         -- vim.print(client.config.settings)
		--         -- local file = assert(io.open("tmpfile123", "a"));
		--         -- file:write(vim.inspect(client.config.settings) .. "\n");
		--         -- file:close()
		--
		--         -- :lua print(client.workspace_folders[1].name .. "\n")
		--         -- :lua print(tostring(not vim.loop.fs_stat(client.workspace_folders[1].name..'/.luarc.json')) .. "\n")
		--         -- :lua print(tostring(not vim.loop.fs_stat(client.workspace_folders[1].name..'/.luarc.jsonc')) .. "\n")
		--
		--
		--         if not vim.loop.fs_stat(path .. "/.luarc.json") then
		--             -- vim.print(special client setup)
		--             client.config.settings = vim.tbl_deep_extend("force", client.config.settings.lua,{
		--                 runtime = {
		--                     version = 'LuaJIT',
		--                     -- path = runtime_path,
		--                 },
		--                 diagnostics = {
		--                     globals = {'vim'},  -- works, but undocommented on website
		--                 },
		--                 workspace = {
		--                     library = { vim.env.VIMRUNTIME },
		--                     -- or pull in all of 'runtiimepath'. NOTE: this is a lot slower
		--                     -- library = vim.api.nvim_get_runtime_file("", true)
		--                     checkThirdParty = false,
		--                 },
		--             })
		--             client.notify("workspace/didChangeConfiguration", { setting = client.config.settings })
		--         end
		--     end,
		-- })

		--------------
		-- C/C++ Setup
		--------------
		lsp_config.clangd.setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})

		-----------
		--CSS Setup
		-----------
		lsp_config.cssls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})

		------------
		--JSON Setup
		------------
		lsp_config.jsonls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			schemas = { require("schemastore").json.schemas() },
		})

		--------------
		--Python Setup
		--------------
		lsp_config.pyright.setup({
			on_attach = on_attach,
			settings = {
				pyright = {
					autoImportCompletion = true,
				},
				python = {
					analysis = {
						autoSearchPaths = true,
						diagnosticMode = "openFilesOnly",
						useLibraryCodeForTypes = true,
						typeCheckingMode = "off",
					},
				},
			},
		})

		-- --Javascript/Typescript Setup
		-- lsp_config.tsserver.setup{
		--     on_attach = on_attach,
		--     capabilities = capabilities
		-- }
		--------------------
		-- TailwindCSS Setup
		--------------------
		-- lsp_config.tailwindcss.setup{
		--     on_attach = on_attach_twcss,
		--     capabilities = capabilities_twcss,
		--     cmd = {
		--         "tailwindcss-language-server", "--stdio"
		--     },
		--     filetypes = {
		--         "aspnetcorerazor", "astro", "astro-markdown", "blade", "clojure",
		--         "django-html", "htmldjango", "edge", "eelixir", "elixir", "ejs", "erb",
		--         "eruby", "gohtml", "haml", "handlebars", "hbs", "html", "html-eex", "heex",
		--         "jade", "leaf", "liquid", "markdown", "mdx", "mustache", "njk", "nunjucks",
		--         "php", "razor", "slim", "twig", "css", "less", "postcss", "sass", "scss",
		--         "stylus", "sugarss", "javascript", "javascriptreact", "reason", "rescript",
		--         "typescript", "typescriptreact", 'vue', "svelte"
		--     },
		--     init_options = {
		--         userLanguages = {
		--           eelixir = "html-eex",
		--           eruby = "erb"
		--       }
		--     },
		--     settings = {
		--         tailwindCSS = {
		--           classAttributes = {
		--             "class", "className", "class:list", "classList", "ngClass"
		--           },
		--           lint = {
		--             cssConflict = "warning",
		--             invalidApply = "error",
		--             invalidConfigPath = "error",
		--             invalidScreen = "error",
		--             invalidTailwindDirective = "error",
		--             invalidVariant = "error",
		--             recommendedVariantOrder = "warning"
		--           },
		--           validate = true
		--
		--         }
		--     }
		-- }
		-----------------------------------------------------------------------------
		-- Fix bug tailwindcss-language-server hight cpu when open html and css file
		-----------------------------------------------------------------------------
		lsp_config.tailwindcss.setup({
			cmd = { "tailwindcss-language-server", "--stdio" },
			on_attach = on_attach_twcss,
			capabilities = capabilities_twcss,
			root_dir = function(fname)
				local root_pattern = require("lspconfig").util.root_pattern(
					"tailwind.config.js",
					"tailwind.config.cjs",
					"tailwind.config.ts",
					"tailwind.config.tsx",
					"tailwind.config.mjs",
					"tailwind.config.coffee",
					"tailwind.config.coffee.js",
					"tailwind.config.coffee.ts",
					"tailwind.config.coffee.tsx",
					"tailwind.config.coffee.mjs",
					"tailwind.config.json",
					"tailwind.config.json5",
					"tailwind.config.yaml",
					"tailwind.config.yml",
					"tailwind.config.toml",
					"tailwind.config.cson",
					"tailwind.config.hjson",
					"tailwind.config.jsonc"
				)
				return root_pattern(fname) or vim.fn.getcwd()
			end,
			filetypes = {
				"aspnetcorerazor",
				"astro",
				"astro-markdown",
				"blade",
				"clojure",
				"django-html",
				"htmldjango",
				"edge",
				"eelixir",
				"elixir",
				"ejs",
				"erb",
				"eruby",
				"gohtml",
				"haml",
				"handlebars",
				"hbs",
				"html",
				"html-eex",
				"heex",
				"jade",
				"leaf",
				"liquid",
				"markdown",
				"mdx",
				"mustache",
				"njk",
				"nunjucks",
				"php",
				"razor",
				"slim",
				"twig",
				"css",
				"less",
				"postcss",
				"sass",
				"scss",
				"stylus",
				"sugarss",
				"javascript",
				"javascriptreact",
				"reason",
				"rescript",
				"typescript",
				"typescriptreact",
				"vue",
				"svelte",
			},
			init_options = {
				userLanguages = {
					eelixir = "html-eex",
					eruby = "erb",
				},
			},
			settings = {
				tailwindCSS = {
					classAttributes = {
						"class",
						"className",
						"class:list",
						"classList",
						"ngClass",
					},
					lint = {
						cssConflict = "warning",
						invalidApply = "error",
						invalidConfigPath = "error",
						invalidScreen = "error",
						invalidTailwindDirective = "error",
						invalidVariant = "error",
						recommendedVariantOrder = "warning",
					},
					validate = true,
				},
			},
		})

		--------------
		--ESLINT Setup
		--------------
		-- lsp_config.eslint.setup{
		--     on_attach = on_attach,
		--     capabilities = capabilities
		-- }
		lsp_config.eslint.setup({
			--- ...
			on_attach = function(client, bufnr)
				vim.api.nvim_create_autocmd("BufWritePre", {
					buffer = bufnr,
					command = "EslintFixAll",
				})
			end,
			capabilities = capabilities,
		})

		------------
		--HTML Setup
		------------
		lsp_config.html.setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})

		------------
		--RUST Setup
		------------
		lsp_config.rust_analyzer.setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})

		-------------------
		--XML/Lemminx Setup
		-------------------
		lsp_config.lemminx.setup({
			settings = {
				xml = {
					server = {
						workDir = "~/.cache/lemminx",
					},
				},
			},
		})

		----------------
		--XML/Ltex Setup
		----------------
		-- lsp_config.ltex.setup {
		--     settings = {
		--     ltex = {
		--       disabledRules = { ['en-US'] = { 'PROFANITY' } },
		--       dictionary = { ['en-US'] = { 'Deno', 'Neovim', 'ltex-ls' } },
		--     },
		--   },
		-- }

		------------
		--Ruff Setup
		------------
		--lsp_config.ruff_lsp.setup{
		--	on_attach = on_attach,
		--	capabilities = capabilities
		--}

		-------
		-- BASH
		-------
		lsp_config.bashls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			filetypes = { "sh", "zsh", "bash", ".bashrc", ".zshrc" },
		})

		----------------
		-- Ansible Setup
		----------------
		lsp_config.ansiblels.setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})

		------------
		--YAML Setup
		------------
		lsp_config.yamlls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			filetypes = { "yaml", "yml" },
			settings = {
				yaml = {
					hover = true,
					format = {
						enable = true,
						singleQuote = true,
					},
					completion = true,
					validate = true,
					customTags = { "!Ref", "!ImportValue" },
					schemas = {
						require("schemastore").yaml.schemas(),
						-- 'https://raw.githubusercontent.com/awslabs/goformation/v4.19.5/schema/cloudformation.schema.json:"/*"',
						-- --kubernetes = "globPattern",
						-- --kubernetes = "*.yaml",
						-- kubernetes = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.28.2-standalone/all.json",
						-- ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
						-- ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
						-- ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
						-- ["http://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
						-- ["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
						-- ["http://json.schemastore.org/ansible-playbook"] = "*play*.{yml,yaml}",
						-- ["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
						-- ["https://json.schemastore.org/dependabot-v2"] = ".github/dependabot.{yml,yaml}",
						-- ["https://json.schemastore.org/gitlab-ci"] = "*gitlab-ci*.{yml,yaml}",
						-- ["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"] = "*api*.{yml,yaml}",
						-- ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "*docker-compose*.{yml,yaml}",
						-- ["https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json"] = "*flow*.{yml,yaml}",
					},
					schemaStore = {
						enable = true,
					},
				},
			},
		})

		--------------
		--Prisma Setup
		--------------
		lsp_config.prismals.setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})

		--------------
		-- emmet Setup
		--------------
		local capabilities_emmet = vim.lsp.protocol.make_client_capabilities()
		capabilities_emmet.textDocument.completion.completionItem.snippetSupport = true
		lsp_config.emmet_ls.setup({
			-- on_attach = on_attach,
			capabilities = capabilities_emmet,
			filetypes = {
				"css",
				"eruby",
				"html",
				"javascript",
				"javascriptreact",
				"less",
				"sass",
				"scss",
				"svelte",
				"pug",
				"typescriptreact",
				"vue",
			},
			init_options = {
				html = {
					options = {
						-- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
						["bem.enabled"] = true,
					},
				},
			},
		})
	end,
}
