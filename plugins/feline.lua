return function(config) -- config parameter is the default table
  local C = require "default_theme.colors"
  local hl = require("core.status").hl
  local provider = require("core.status").provider
  local conditional = require("core.status").conditional
  local vi_mode_utils = require "feline.providers.vi_mode"

  return {
    disable = { filetypes = { "^NvimTree$", "^neo%-tree$", "^dashboard$", "^Outline$", "^aerial$" } },
    theme = hl.group("StatusLine", { fg = C.fg, bg = C.bg_1 }),
    components = {
      active = {
        {
          { provider = provider.spacer(), hl = hl.mode() },
          { provider = function () return vi_mode_utils.get_vim_mode() end, hl = hl.mode() },
          { provider = provider.spacer(), hl = hl.mode() },
          { provider = provider.spacer(1) },
          { --- File Icon
            provider = function ()
              local filename = vim.fn.expand('%:t')
              local extension = vim.fn.expand('%:e')
              local icon  = require'nvim-web-devicons'.get_icon(filename, extension)
              if icon == nil then
                icon = ''
              end
              return icon
            end,
            hl = {
              fg = "#61afef",
              style = "bold"
            },
            left_sep = ' ',
            right_sep = ' '
          },
          { --- File Name
            provider = function ()
              return vim.fn.expand("%:t")
            end,
            hl = {
              fg = "#61afef",
              style = "bold"
            }
          },
          { provider = provider.spacer(2) },
          { provider = "git_branch", hl = { fg = "#616161", style = "bold" }, icon = " " },
          { provider = provider.spacer(2), enabled = conditional.git_available },
          -- { provider = provider.spacer(2), enabled = conditional.has_filetype },
          { provider = "git_diff_added", hl = hl.fg("GitSignsAdd", { fg = C.green }), icon = "  " },
          { provider = "git_diff_changed", hl = hl.fg("GitSignsChange", { fg = C.orange_1 }), icon = " 柳" },
          { provider = "git_diff_removed", hl = hl.fg("GitSignsDelete", { fg = C.red_1 }), icon = "  " },
          -- { provider = provider.spacer(2), enabled = conditional.git_changed },
          { provider = "diagnostic_errors", hl = hl.fg("DiagnosticError", { fg = C.red_1 }), icon = "  " },
          { provider = "diagnostic_warnings", hl = hl.fg("DiagnosticWarn", { fg = C.orange_1 }), icon = "  " },
          { provider = "diagnostic_info", hl = hl.fg("DiagnosticInfo", { fg = C.white_2 }), icon = "  " },
          { provider = "diagnostic_hints", hl = hl.fg("DiagnosticHint", { fg = C.yellow_1 }), icon = "  " },
        },
        {
          { provider = provider.lsp_progress, enabled = conditional.bar_width() },
          -- {
          --   provider = provider.lsp_client_names(true),
          --   short_provider = provider.lsp_client_names(),
          --   enabled = conditional.bar_width(),
          --   icon = "   ",
          -- },
          { provider = provider.spacer(2), enabled = conditional.bar_width() },
          {
            provider = provider.treesitter_status,
            enabled = conditional.bar_width(),
            hl = hl.fg("GitSignsAdd", { fg = C.green }),
          },
          { provider = provider.spacer(2) },
          { provider = provider.spacer(2), hl = hl.mode()},
          { provider = function ()
              local os = vim.bo.fileformat:upper()
              local icon
              if os == 'UNIX' then
                  icon = ' '
              elseif os == 'MAC' then
                  icon = ' '
              else
                  icon = ' '
              end
              return icon .. os
            end,
            hl = hl.mode(),
          },
          { provider = provider.spacer(1), hl = hl.mode() },
          { provider = "position", hl = hl.mode()},
          -- { provider = provider.spacer(2) },
          -- { provider = "line_percentage" },
          -- { provider = provider.spacer() },
          -- { provider = "scroll_bar", hl = hl.fg("TypeDef", { fg = C.yellow }) },
          { provider = provider.spacer(1), hl = hl.mode()},
        },
      },
    },
  }
end
