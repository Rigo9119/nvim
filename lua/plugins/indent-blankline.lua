return {
  "lukas-reineke/indent-blankline.nvim",
  opts = function(_, opts)
    -- Other blankline configuration here
    return require("indent-rainbowline").make_opts(opts, {
      color_transparency = 0.7,
      colors = { 0x610C9F, 0x940B92, 0xDA0C81, 0xE95793 },
    })
  end,
  dependencies = {
    "TheGLander/indent-rainbowline.nvim",
  },
}
