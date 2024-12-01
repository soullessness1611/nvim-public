return {
    "windwp/nvim-autopairs",
    event ="InsertEnter",
    enabled = true,
    dependencies = {
      "windwp/nvim-ts-autotag",
      event = "InsertEnter",
      enabled = true,
      config = function()
        require("nvim-ts-autotag").setup({})
      end
    },
    opts ={
      check_ts = true, -- enable treesitter
      ts_config = {
        lua = { "String" }, -- don't add pairs in lua string treesitter nodes
        javascript = { "template_string" } -- don't add pairs in javascript template_string
      }
    },
    config = function()
      require("nvim-autopairs").setup{
    disable_filetypes = {'TelescopePrompt','vim'}
  }
end
}
