return {
  "elentok/format-on-save.nvim",
  event="VeryLazy",
  config = function()
    local format_on_save = require("format-on-save")
local formatters = require("format-on-save.formatters")
local vim_notify = require("format-on-save.error-notifiers.vim-notify")

format_on_save.setup({
	error_notifier = vim_notify,
	stderr_loglevel = vim.log.levels.OFF,
	exclude_path_patterns = {
		"node_modules/",
		".local/share/nvim/",
	},
	formatter_by_ft = {
		javascript = formatters.prettierd,
		javascriptreact = formatters.prettierd,
		typescript = formatters.prettierd,
		typescriptreact = formatters.prettierd,
		json = formatters.prettierd,
		html = formatters.prettierd,
		css = formatters.prettierd,
		scss = formatters.prettierd,
		markdown = formatters.prettierd,
		yaml = formatters.prettierd,
		lua = formatters.stylua,
		python = formatters.black,
		formatters.isort,
		formatters.shell({ cmd = { "tidy-imports", "isort --profile black -l 160" } }),
		-- python = {formatters.black,formatters.isort},
		rust = formatters.rustfmt,
		go = formatters.goimports,
		cpp = formatters.clang_format,
		c = formatters.clang_format,
		dart = formatters.dart_format,
		java = formatters.google_java_format,
		kotlin = formatters.kotlinc,
		php = formatters.phpcbf,
		sh = formatters.shfmt,
		sql = formatters.sqlformat,
		toml = formatters.tomlformat,
		vim = formatters.vimlfmt,
		vue = formatters.prettierd,
		svelte = formatters.prettierd,
		graphql = formatters.prettierd,
		ruby = formatters.rubocop,
		haskell = formatters.stylish_haskell,
		ocaml = formatters.ocp_indent,
		scala = formatters.scalafmt,
		clojure = formatters.cljfmt,
		clojurescript = formatters.cljfmt,
		clojurec = formatters.cljfmt,
		clojurex = formatters.cljfmt,
		fennel = formatters.fennel,
		fish = formatters.fish_indent,
		zig = formatters.zigfmt,
		zigbee = formatters.zigfmt,
		zigbuf = formatters.zigfmt,
		zigwatch = formatters.zigfmt,
		zigtest = formatters.zigfmt,
	},

	-- Optional: fallback formatter to use when no formatter match the current
	fallback_formatter = {
		formatters.remove_trailling_whitespace,
		formatters.remove_trailing_newlines,
		formatters.prettierd,
	},

	-- By default, all shell commands are prefixed with "sh-c" (see PR  #3)
	-- To prevent that set `run_with_sh` to `false`.
	run_with_sh = false,
})
  end
}
