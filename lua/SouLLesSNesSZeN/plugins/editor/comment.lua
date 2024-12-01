return {
  "numToStr/Comment.nvim",
  event ="InsertEnter",
  dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
  config = function()
    require("Comment").setup()
  end,
}
