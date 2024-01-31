-- LSP Utilities and configuration

return {
  {
    -- lsp_lines:lsp_lines is a simple neovim plugin that renders diagnostics using
    -- virtual lines on top of the real line of code.
    "abzcoding/lsp_lines.nvim",
    config = function()
      require("lsp_lines").setup()
      require("astonvim.utils").set_mappings({
        n = {
          ["<leader>lT"] = { require("lsp_lines").toggle,  desc = "Toggle lsp_lines" }
        }
      })
    end,
  },
  {
    "AstroNvim/astrotheme", -- default AstroNvim theme
    lazy = false,
  },

  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.colorscheme.everforest" },
  {
    "sainnhe/everforest",
    lazy = false,
  },
  { import = "astrocommunity.colorscheme.nightfox-nvim" },
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
  },
  { import = "astrocommunity.colorscheme.kanagawa-nvim" },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
  },
  { import = "astrocommunity.colorscheme.github-nvim-theme" }, -- no background support
  {
    "projekt0n/github-nvim-theme",
    lazy = false,
  },
  {
    "oxfist/night-owl.nvim",
    lazy = false,
  },
}
