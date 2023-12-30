return {
  "lukas-reineke/indent-blankline.nvim",
  opts = function(_, opts)
    -- Other blankline configuration here
    return require("indent-rainbowline").make_opts(opts, {
      color_transparency = 0.20,
    })
  end,
  dependencies = {
    "TheGLander/indent-rainbowline.nvim",
  },
}
