return {

  -- messages, cmdline and hte popupmenu
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })
      local focused = true
      vim.api.nvim_create_autocmd("FocusGained", {
        callback = function()
          focused = true
        end,
      })
      vim.api.nvim_create_autocmd("FocusLost", {
        callback = function()
          focused = false
        end,
      })
      table.insert(opts.routes, 1, {
        filter = {
          cond = function()
            return not focused
          end,
        },
        view = "notify_send",
        opts = { stop = false },
      })

      opts.commands = {
        all = {
          -- options for the message history that you get with `:Noice`
          wiew = "split",
          opts = { enter = true, format = "details" },
          filter = {},
        },
      }

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        callback = function(event)
          vim.schedule(function()
            require("noice.text.markdown").keys(event.buf)
          end)
        end,
      })

      opts.presets.lsp_doc_border = true
    end,
  },

  -- notify show time
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 10000,
    },
  },

  -- animations
  {
    "echasnovski/mini.animate",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.scroll = {
        enable = false,
      }
    end,
  },

  -- buffer line
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
      { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
      { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
    },
    opts = {
      options = {
        mode = "tabs",
       separator_style = "slant",
        indicator = {
          style = "none",
        },
        show_buffer_close_icons = false,
        show_close_icon = false,
        left_trunc_marker = ' ',
        right_trunc_marker = ' ',
      },
      highlights = {
        fill = {
          fg = '#000000',
          bg = '#000000',
        },
        background = {
          --fg = '#000000',
          bg = '#000000',
        },
        tab = {
          fg = '#000000',
          bg = '#000000',
        },
        tab_selected = {
          fg = '#000000',
          bg = '#000000',
        },
        tab_separator = {
          fg = '#000000',
          bg = '#000000',
        },
        tab_separator_selected = {
          fg = '#000000',
          bg = '#000000',
          sp = '#000000',
        },
        tab_close = {
          fg = '#000000',
          bg = '#000000',
        },
        close_button = {
          fg = '#000000',
          bg = '#000000',
        },
        close_button_visible = {
          fg = '#000000',
          bg = '#000000',
        },
        close_button_selected = {
          fg = '#000000',
          bg = '#000000',
        },
        buffer_visible = {
          --fg = '#000000',
          bg = '#000000',
        },
        buffer_selected = {
          --fg = '#000000',
          bg = '#000000',
          bold = true,
          italic = true,
        },
        numbers = {
          --fg = '#000000',
          bg = '#000000',
        },
        numbers_visible = {
          --fg = '#000000',
          bg = '#000000',
        },
        numbers_selected = {
          --fg = '#000000',
          bg = '#000000',
        },
        diagnostic = {
          --fg = '#000000',
          bg = '#000000',
        },
        diagnostic_visible = {
          --fg = '#000000',
          bg = '#000000',
        },
        diagnostic_selected = {
          --fg = '#000000',
          bg = '#000000',
        },
        hint = {
          --fg = '#000000',
          sp = '#000000',
          bg = '#000000',
        },
        hint_visible = {
          --fg = '#000000',
          bg = '#000000',
        },
        hint_selected = {
          --fg = '#000000',
          bg = '#000000',
          sp = '#000000',
        },
        hint_diagnostic = {
          --fg = '#000000',
          sp = '#000000',
          bg = '#000000',
        },
        hint_diagnostic_visible = {
          --fg = '#000000',
          bg = '#000000',
        },
        hint_diagnostic_selected = {
          --fg = '#000000',
          bg = '#000000',
          sp = '#000000',
        },
        info = {
          --fg = '#000000',
          sp = '#000000',
          bg = '#000000',
        },
        info_visible = {
          --fg = '#000000',
          bg = '#000000',
        },
        info_selected = {
          --fg = '#000000',
          bg = '#000000',
          sp = '#000000',
        },
        info_diagnostic = {
          --fg = '#000000',
          sp = '#000000',
          bg = '#000000',
        },
        info_diagnostic_visible = {
          --fg = '#000000',
          bg = '#000000',
        },
        info_diagnostic_selected = {
          --fg = '#000000',
          bg = '#000000',
          sp = '#000000',
        },
        warning = {
          --fg = '#000000',
          sp = '#000000',
          bg = '#000000',
        },
        warning_visible = {
          --fg = '#000000',
          bg = '#000000',
        },
        warning_selected = {
          --fg = '#000000',
          bg = '#000000',
          sp = '#000000',
        },
        warning_diagnostic = {
          --fg = '#000000',
          sp = '#000000',
          bg = '#000000',
        },
        warning_diagnostic_visible = {
          --fg = '#000000',
          bg = '#000000',
        },
        warning_diagnostic_selected = {
          --fg = '#000000',
          bg = '#000000',
          sp = '#000000',
        },
        error = {
          --fg = '#000000',
          bg = '#000000',
          sp = '#000000',
        },
        error_visible = {
          --fg = '#000000',
          bg = '#000000',
        },
        error_selected = {
          --fg = '#000000',
          bg = '#000000',
          sp = '#000000',
        },
        error_diagnostic = {
          --fg = '#000000',
          bg = '#000000',
          sp = '#000000',
        },
        error_diagnostic_visible = {
          --fg = '#000000',
          bg = '#000000',
        },
        error_diagnostic_selected = {
          --fg = '#000000',
          bg = '#000000',
          sp = '#000000',
        },
        modified = {
          --fg = '#000000',
          bg = '#000000',
        },
        modified_visible = {
          --fg = '#000000',
          bg = '#000000',
        },
        modified_selected = {
          --fg = '#000000',
          bg = '#000000',
        },
        duplicate_selected = {
          --fg = '#000000',
          bg = '#000000',
          italic = true,
        },
        duplicate_visible = {
          --fg = '#000000',
          bg = '#000000',
        },
        duplicate = {
          --fg = '#000000',
          bg = '#000000',
        },
        separator_selected = {
          fg = '#000000',
          bg = '#000000',
        },
        separator_visible = {
          fg = '#000000',
          bg = '#000000',
        },
        separator = {
          fg = '#000000',
          bg = '#000000',
        },
        indicator_visible = {
          --fg = '#000000',
          bg = '#000000',
        },
        indicator_selected = {
          --fg = '#000000',
          bg = '#000000',
        },
        pick_selected = {
          --fg = '#000000',
          bg = '#000000',
        },
        pick_visible = {
          --fg = '#000000',
          bg = '#000000',
        },
        pick = {
          --fg = '#000000',
          bg = '#000000',
        },
        offset_separator = {
          --fg = '#000000',
          bg = '#000000',
        },
        trunc_marker = {
          --fg = '#000000',
          bg = '#000000',
        },
      },
    },
  },

  -- statusline
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        theme = "solarized_dark",
      },
    },
  },

  -- filename
  {
    "b0o/incline.nvim",
    dependencies = { "craftzdog/solarized-osaka.nvim" },
    event = "BufReadPre",
    priority = 1200,
    config = function()
      local colors = require("solarized-osaka.colors").setup()
      require("incline").setup({
        highlight = {
          groups = {
            InclineNormal = { guibg = colors.magenta500, guifg = colors.base04 },
            InclineNormalNC = { guifg = colors.violet500, guibg = colors.base03 },
          },
        },
        window = { margin = { vertical = 0, horizontal = 1 } },
        hide = {
          cursorline = true,
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          if vim.bo[props.buf].modified then
            filename = "[+] " .. filename
          end

          local icon, color = require("nvim-web-devicons").get_icon_color(filename)
          return { { icon, guifg = color }, { " " }, { filename } }
        end,
      })
    end,
  },

  -- Zen mode
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
      plugins = {
        gitsigns = true,
        tmux = true,
        kitty = { enabled = false, font = "+2" },
      },
    },
    keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
  },
}
