return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },

  -- conflicts with AstroNvim keys for resize vertical split
  {
    "mg979/vim-visual-multi",
    event = "User AstroFile",
    -- lazy = false,
    -- lazy load on key binding
    -- keys = "gm",
  },
  {
    -- Format markdown tables
    -- https://github.com/allen-mack/nvim-table-md
    "allen-mack/nvim-table-md",
    ft = { "markdown" },
  },
  {
    "nvim-orgmode/orgmode",
    dependencies = {
      { "nvim-treesitter/nvim-treesitter", lazy = true },
    },
    event = "VeryLazy",
    config = function()
      -- Load treesitter grammar for org
      require("orgmode").setup_ts_grammar()

      -- Setup treesitter
      -- require('nvim-treesitter.configs').setup({
      --   highlight = {
      --     enable = true,
      --     additional_vim_regex_highlighting = { 'org' },
      --   },
      --   ensure_installed = { 'org' },
      -- })
      --
      -- Setup orgmode
      require("orgmode").setup {
        org_agenda_files = "~/Documents/org/*",
        org_default_notes_file = "~/Documents/refile.org",
      }
    end,
  },
  {
    "lukas-reineke/headlines.nvim",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = true, -- or `opts = {}`
  },
  {
    "akinsho/org-bullets.nvim",
    config = function()
      require("org-bullets").setup {
        symbols = {
          -- list symbol
          list = "•",
          -- headlines can be a list
          headlines = { "◉", "○", "✸", "✿" },
          checkboxes = {
            half = { "", "OrgTSCheckboxHalfChecked" },
            done = { "✓", "OrgDone" },
            todo = { "˟", "OrgTODO" },
          },
        },
      }
    end,
  },
}
