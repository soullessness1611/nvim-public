return {
  "lukas-reineke/indent-blankline.nvim",
  dependencies = { 
    "HiPhish/rainbow-delimiters.nvim",
    "p00f/nvim-ts-rainbow"
  },
  config = function()
    local highlight = {
    "RainbowRed",
    "RainbowYellow",
    "RainbowBlue",
    "RainbowOrange",
    "RainbowGreen",
    "RainbowViolet",
    "RainbowCyan",
}
local hooks = require "ibl.hooks"
-- Rainbow Pastel Colors
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
    vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
    vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
    vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
    vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
    vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
    vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
end)

-- Rainbow 7Colors
-- hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
--     vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#FE0000" })
--     vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#FFD800" })
--     vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#0026FF" })
--     vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#FE6A00" })
--     vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#00FE21" })
--     vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#B100FE" })
--     vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#0094FE" })
-- end)

-- Rainbow Neon Colors
-- hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
--     vim.api.nvim_set_hl(0, "RainbowRed", { fg = "Crimson" }) --#FF073A
--     vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#CFFF04" })
--     vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#2F46FA" })
--     vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#FF8800" })
--     vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#39ff07" })
--     vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#FE019A" })
--     vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#12B8FF" })
-- end)


vim.g.rainbow_delimiters = { highlight = highlight }
require("ibl").setup {
    indent = {
        -- highlight = highlight,
        -- char = '┋',
         char = ' ',
    },
    scope = {
        enabled = true,
        show_start = true,
        show_end = false,
        highlight = highlight,
        char = '▏',
        -- char = '┋',
        -- char = '▕',
        -- char ='║',
        include = { node_type = { ["*"] = { "*" } } },
    },
}

hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
  end
}
