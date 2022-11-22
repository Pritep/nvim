return {
  colorscheme = "catppuccin", -- melange

  options = function(local_vim)
      --- CONFIG THEMES ---
    local_vim.g.sonokai_style = "atlantis"
      --- CONFIG NEOVIDE NEOVIM
    -- local_vim.opt.guifont = { "mononoki Nerd Font", ":h15" }
    -- local_vim.g.neovide_transparency = 0.9
    -- local_vim.g.neovide_background_color = '#000'

    return local_vim
  end,
  plugins = {
    init = {
      ------------ THEMES -------------
      {
        "catppuccin/nvim", --- catppuccin-     mocha macchiato frappe latte comunity --> amoled catppuccino
        as = "catppuccin",
        config = function ()
          require("catppuccin/nvim").setup {
            flavour = "mocha"
          }
        end
      },
      {
        "sainnhe/sonokai",
      },
      -- {
      --   "joshdick/onedark.vim"
      -- },
      {
        "navarasu/onedark.nvim",
        config = function ()
          require("onedark").setup {
            style = "darker"
          }
          -- require('onedark').load()
        end
      },
      -- {
      --   "lukas-reineke/onedark.nvim"
      -- },
      {
        "EdenEast/nightfox.nvim", --- Terafox Nightfox Dayfox Dawnfox Duskfox Nordfox Carbonfox
      },
      {
        "projekt0n/github-nvim-theme"
        --- github_  dark light dimmed colorblind light_default default
      },
      {
        "Shatur/neovim-ayu" --- ayu-   mirage light dark
      },
      {
        "savq/melange"
      },
      {
        "folke/tokyonight.nvim",
      },
      ------------ PLUGINS -------------
      -- {
      --   "eslint/eslint"
      -- },
      -- {
      --   "aserowy/tmux.nvim",
      --   config = function() require("tmux").setup() end
      -- },
    },
    feline = {
      require("feline")
    },
  },
}
