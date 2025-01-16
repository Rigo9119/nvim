-- Bubbles config for lualine
-- Author: lokesh-krishna
-- MIT license, see LICENSE for more details.
local icons = LazyVim.config.icons

-- stylua: ignore
local colors = {
  blue   = '#80a0ff',
  cyan   = '#79dac8',
  black  = '#080808',
  white  = '#c6c6c6',
  red    = '#ff5189',
  violet = '#d183e8',
  grey   = '#303030',
  green  = '#98be65',
  orange = '#FF8800',
  yellow   = '#ECBE7B',
}

local bubbles_theme = {
  normal = {
    a = { fg = colors.black, bg = colors.violet },
    b = { fg = colors.white, bg = colors.grey },
    c = { fg = colors.white },
  },

  insert = { a = { fg = colors.black, bg = colors.green } },
  visual = { a = { fg = colors.black, bg = colors.orange } },
  replace = { a = { fg = colors.black, bg = colors.red } },

  inactive = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.white },
  },
}

local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  symbols = {
    error = icons.diagnostics.Error,
    warn = icons.diagnostics.Warn,
    info = icons.diagnostics.Info,
    hint = icons.diagnostics.Hint,
  },
  diagnostics_color = {
    error = { fg = colors.red },
    warn = { fg = colors.yellow },
    info = { fg = colors.cyan },
  },
}

local diff = {
  "diff",
  symbols = { added = icons.git.added, modified = icons.git.modified, removed = icons.git.removed },
  diff_color = {
    added = { fg = colors.green },
    modified = { fg = colors.orange },
    removed = { fg = colors.red },
  },
}

local encoding = {
  "o:encoding", -- option component same as &encoding in viml
  fmt = string.upper, -- I'm not sure why it's upper case either ;)
  color = { fg = colors.white, gui = "bold" },
}

local fileFormat = {
  "fileformat",
  fmt = string.upper,
  icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
  color = { fg = colors.white, gui = "bold" },
}

return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  init = function()
    vim.g.lualine_laststatus = vim.o.laststatus
    if vim.fn.argc(-1) > 0 then
      -- set an empty statusline till lualine loads
      vim.o.statusline = " "
    else
      -- hide the statusline on the starter page
      vim.o.laststatus = 0
    end
  end,
  opts = function()
    vim.o.laststatus = vim.g.lualine_laststatus
    local kirby_default = "(>*-*)>"
    local mode_kirby = {
      n = "<(•ᴗ•)>",
      i = "<(•o•)>",
      v = "(v•-•)v",
      [""] = "(v•-•)>",
      V = "(>•-•)>",
      c = kirby_default,
      no = "<(•ᴗ•)>",
      s = kirby_default,
      S = kirby_default,
      [""] = kirby_default,
      ic = kirby_default,
      R = kirby_default,
      Rv = kirby_default,
      cv = "<(•ᴗ•)>",
      ce = "<(•ᴗ•)>",
      r = kirby_default,
      rm = kirby_default,
      ["r?"] = kirby_default,
      ["!"] = "<(•ᴗ•)>",
      t = "<(•ᴗ•)>",
    }

    local opts = {
      options = {
        theme = bubbles_theme,
        globalstatus = vim.o.laststatus == 3,
        component_separators = "",
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
          "packer",
          statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard" },
        },
      },
      sections = {
        lualine_a = {
          {
            "mode",
            fmt = function()
              return mode_kirby[vim.fn.mode()] or vim.api.nvim_get_mode().mode
            end,
            separator = { left = "" },
            right_padding = 2,
          },
        },
        lualine_b = {
          "branch",
          "filename",
          diff,
          diagnostics,
        },
        lualine_c = {},
        lualine_x = {},
        lualine_y = { encoding, fileFormat, "filetype", "progress" },
        lualine_z = {
          { "location", separator = { right = "" }, left_padding = 2 },
        },
      },
      inactive_sections = {
        lualine_a = { "filename" },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { "location" },
      },
      tabline = {},
      extensions = { "neo-tree" },
    }

    -- do not add trouble symbols if aerial is enabled
    -- And allow it to be overriden for some buffer types (see autocmds)
    if vim.g.trouble_lualine and LazyVim.has("trouble.nvim") then
      local trouble = require("trouble")
      local symbols = trouble.statusline({
        mode = "symbols",
        groups = {},
        title = false,
        filter = { range = true },
        format = "{kind_icon}{symbol.name:Normal}",
        hl_group = "lualine_c_normal",
      })
      table.insert(opts.sections.lualine_c, {
        symbols and symbols.get,
        cond = function()
          return vim.b.trouble_lualine ~= false and symbols.has()
        end,
      })
    end
    return opts
  end,
}
