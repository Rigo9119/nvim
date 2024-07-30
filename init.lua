-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

require("tabnine").setup({
  disable_auto_comment = true,
  accept_keymap = "a",
  dismiss_keymap = "<C-]>",
  debounce_ms = 800,
  suggestion_color = { gui = "#a1c8c2", cterm = 244 },
  exclude_filetypes = { "TelescopePrompt", "NvimTree" },
  log_file_path = nil, -- absolute path to Tabnine log file
  ignore_certificate_errors = false,
})
