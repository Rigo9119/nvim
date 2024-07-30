return {
  "nvim-cmp",
  dependencies = { "hrsh7th/cmp-emoji" },
  opts = function(_, opts)
    table.insert(opts.sources, { name = "emoji" })
  end,
  config = function()
    require("cmp").setup({
      sources = {
        { name = "tabnine" },
        -- other sources...
      },
      -- other cmp settings...
    })
  end,
}
