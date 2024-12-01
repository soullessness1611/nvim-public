return {
  "shellRaining/hlchunk.nvim",
  config = function()
    -- use a protected call so we don't error out on first use "Legendary"
local status_ok, hlchunk = pcall(require, "hlchunk")
if not status_ok then
    vim.notify("Plugin [hlchunk] failed to load", vim.log.levels.WARN)
    return
end

hlchunk.setup({
    chunk = {
        enable = true,
        notify = true,
        use_treesitter = true,
        chars = {
            horizontal_line = "─",
            vertical_line = "│",
            left_top = "╭",
            left_bottom = "╰",
            right_arrow = ">",
        },
        style = {
            { fg = "#806d9c" },
            { fg = "#c21f30" }, -- this fg is used to highlight wrong chunk
        },
        textobject = "",
        max_file_size = 1024 * 1024,
        error_sign = true,
    },

    indent = {
        enable = false,
        use_treesitter = false,
        chars = {
            "│",
        },
        style = {
            {
                fg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Whitespace")), "fg", "gui"),
            },
        },
    },

    line_num = {
        enable = false,
        use_treesitter = false,
        style = "#806d9c",
    },

    blank = {
        enable = false,
        chars = {
            "․",
        },
        style = {
            vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Whitespace")), "fg", "gui"),
        },
    },
})
  end
}
