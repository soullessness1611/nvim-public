return {
  "nvim-treesitter/nvim-treesitter",
  event = "VeryLazy",
  build = ":TSUpdate",
  run = function()
    require("nvim-treesitter.install").update({
      with_sync = true,
    })
  end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    "nvim-treesitter/nvim-treesitter-context",
    "duane9/nvim-rg",
    config = function()
      local status_ok, context = pcall(require, 'treesitter-context')
if not status_ok then
  print('‼ tressitter-context not loaded or not installed.')
  return
end

context.setup({
      enable = true,            -- Enable this plugin (Can be enabled/disabled later via commands)
      max_lines = 10,            -- How many lines the window should span. Values <= 0 mean no limit.
      -- min_window_height = 0,    -- Minimum editor window height to enable context. Values <= 0 mean no limit.
      -- line_numbers = true,
      -- multiline_threshold = 20, -- Maximum number of lines to show for a single context
      -- trim_scope = 'center',     -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
      mode = 'cursor',          -- Line used to calculate context. Choices: 'cursor', 'topline'
      -- Separator between context and content. Should be a single character string, like '-'.
      -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
      -- separator = nil,
      -- zindex = 20,     -- The Z-index of the context window
      -- on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
    })
    end
  },
  config = function()
    local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

ts.setup {
    highlight = {
        enable = true,
        disable = {},
    },
    indent = {
        enable = true,
        disable = {},
    },
    ensure_installed = {
        "tsx",
        "toml",
        "fish",
        "php",
        "json",
        "yaml",
        "css",
        "html",
        "lua",
        "markdown",
        "markdown_inline",
        "typescript",
        "python",
        "vim",
        "vimdoc",
        "query",
        "bash",
        "javascript",
        "prisma",
    },
    -- autotag = {
    --     enable = true,
    -- },
    context_commnetstring = {
        enable = true,
        enable_autocmd = false
    }
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
  end
}
