return {
  "rebelot/kanagawa.nvim",
  priority = 1000,
  name = "kanagawa",
  config = function()
    -- load the colorscheme here
    vim.cmd("colorscheme kanagawa-wave")
  end,
}
