return {
  "norcalli/nvim-colorizer.lua",
  event = "BufReadPost",

  config = function()
    require("colorizer").setup({
      "*", -- all filetypes
    }, {
      RGB = true,
      RRGGBB = true,
      names = true,
      RRGGBBAA = true,
      AARRGGBB = true,
      rgb_fn = true,
      hsl_fn = true,
      css = true,
      css_fn = true,
    })
  end,
}
