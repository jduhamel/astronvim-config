-- Mapping data with "desc" stored directly by vim.keymap.set().
-- Register which-key menu name with `name` and without command
--
-- This mappings table is the lower level configuration and more robust approach
-- which-key will automatically pick-up stored data by this setting

-- Icons can be copied from https://www.nerdfonts.com/cheat-sheet

return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    ["<leader><tab>"] = { "<cmd>b#<cr>", desc = "Last tab" },

    -- Save prompting for file name
    ["<leader>W"] = { ":write ", desc = "Save as file" },
    ["<leader>W!"] = { ":SudaWrite<CR>", desc = "Suda Write" },
    -- mappings seen under group name "Buffer"
    ["<leader>b"] = { name = "Buffers" },
    ["<leader>bt"] = { name = "Tabs" },
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>btn"] = { "<cmd>tabNext<cr>", desc = "Next tab" },
    ["<leader>bt<tab>"] = { "<cmd>tabprevious<cr>", desc = "Previous tab" },
    -- ["<leader>bD"] = { "<cmd>Bdelete<cr>", desc = "Delete buffer" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- Find Menu
    -- browse via directory structure, create and modify paths
    ["<leader>fe"] = { "<cmd>Telescope file_browser<cr>", desc = "Explorer" },

    -- this is useful for naming menus
    ["<leader>j"] = { name = "Jump" },

    -- Markdown
    ["<leader>m"] = { name = "Markdown" },
    ["<Leader>mf"] = { ':lua require("tablemd").format()<cr>', desc = "Markdown" },
    ["<Leader>mc"] = { ':lua require("tablemd").insertColumn(false)<cr>', desc = "Markdown" },
    ["<Leader>md"] = { ':lua require("tablemd").deleteColumn()<cr>', desc = "Markdown" },
    ["<Leader>mr"] = { ':lua require("tablemd").insertRow(false)<cr>', desc = "Markdown" },
    ["<Leader>mR"] = { ':lua require("tablemd").insertRow(true)<cr>', desc = "Markdown" },
    ["<Leader>mj"] = { ':lua require("tablemd").alignColumn("left")<cr>', desc = "Markdown" },
    ["<Leader>mk"] = { ':lua require("tablemd").alignColumn("center")<cr>', desc = "Markdown" },
    ["<Leader>ml"] = { ':lua require("tablemd").alignColumn("right")<cr>', desc = "Markdown" },

    -- Projects
    ["<leader>fp"] = { "<cmd>Telescope projects<cr>", desc = "Projects" },

    -- Editing
    ["zZ"] = { "<cmd>ZenMode<cr>", desc = " Zen mode" },

    -- Git Menu
    -- Menu mappings
    ["<leader>gh"] = false, -- disable Reset Git Hunk mapping, used for Octo in plugins/git.lua
    ["<leader>gH"] = { function() require("gitsigns").stage_hunk() end, desc = "Stage Git hunk" },
    ["<leader>gn"] = { name = " Neogit" }, -- Neogit menu
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command

    -- Code Runner
    ["<leader>x"] = { name = "☑ Tasks" },
    ["<leader>xo"] = { "<cmd>OverseerRun<cr>", desc = "⚙ Overseer Run" },
    ["<leader>xrr"] = { "<cmd>SnipRun<cr>", desc = "⚙ SnipRun" },
    ["<leader>xri"] = { "<cmd>SnipInfo<cr>", desc = "⚙ SnipInfo" },
    ["<leader>xR"] = { "<cmd>SnipRunOperator<cr>", desc = "⚙ SnipRunOperator" },
    ["<leader>xt"] = { "<cmd>Task<cr>", desc = "⚙ Task" },

    -- Test keys
    ["<leader>T"] = { name = " Tests" },
    ["<leader>To"] = { "<cmd>lua require('neotest').output.open({ enter = true, short = false })<cr>", desc = "Output" },
    ["<leader>Tr"] = { "<cmd>lua require('neotest').run.run({env=require('user.ntest').get_env()})<cr>", desc = "Run" },
    ["<leader>Ta"] = { "<cmd>lua require('user.ntest').run_all()<cr>", desc = "Run All" },
    ["<leader>Tc"] = { "<cmd>lua require('user.ntest').cancel()<cr>", desc = "Cancel" },
       ["<leader>TR"] = { "<cmd>lua require('user.ntest').run_file_sync()<cr>", desc = "Run Async" },
    ["<leader>Ts"] = { "<cmd>lua require('neotest').summary.toggle()<cr>", desc = "Summary" },
    ["<leader>Tn"] = {
      "<cmd>lua require('neotest').jump.next({ status = 'failed' })<cr>",
      desc = "jump to next failed",
    },
    ["<leader>Tp"] = {
      "<cmd>lua require('neotest').jump.prev({ status = 'failed' })<cr>",
      desc = "jump to previous failed",
    },
    ["<leader>Td"] = { "<cmd>lua require('neotest').run.run({ strategy = 'dap' })<cr>", desc = "Dap Run" },
    ["<leader>Tx"] = { "<cmd>lua require('neotest').run.stop()<cr>", desc = "Stop" },
    ["<leader>Tw"] = { "<cmd>lua require('neotest').watch.watch()<cr>", desc = "Watch" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },

  v = {
    ["f"] = { "<cmd>SnipRun<cr>", silent = true, desc = "SnipRun" },
    --    vim.api.nvim_set_keymap('v', 'f', '<Plug>SnipRun', {silent = true})

    -- Use panadoc to format a visually selected table
    -- https://jcuenod.github.io/bibletech/2023/03/14/formatting-md-tables-in-neovim/
    ["<leader>mp"] = {
      "!pandoc -t markdown-simple_tables<CR>",
      silent = true,
      desc = "Align selected md table using pandoc",
    },
  },
}
