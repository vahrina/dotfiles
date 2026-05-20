return {
  "folke/twilight.nvim",
  event = "BufReadPost",
  opts = {
    context = 10,
    treesitter = true,
    dimming = {
      alpha = 0.3,
      color = { "Normal", "#cdd6f4" },
      term_bg = "#1e1e2e",
      inactive = false,
    },
    expand = {
      "function",
      "method",
      "table",
      "if_statement",
    },
    exclude = { "txt", "help" },
  },
  keys = {
    { "<leader>tw", "<cmd>Twilight<cr>", desc = "toggle twilight" },
  },
  config = function(_, opts)
    require("twilight").setup(opts)
    vim.cmd("TwilightEnable")
  end,
}
