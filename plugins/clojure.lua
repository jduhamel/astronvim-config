return {
  -- Parinfer parens management for Clojure
  {
    "dundalek/parpar.nvim",
    ft = { "clojure", "lisp", "scheme", "edn"},
    dependencies = { "gpanders/nvim-parinfer", "julienvincent/nvim-paredit" },
    config = function()
      local paredit = require("nvim-paredit")
      require("parpar").setup {
      paredit = {
        -- pass any nvim-paredit options here
        extensions = {
          commonlisp = {
            -- Should return the 'root' of the given Treesitter node. For example:
            -- The node at cursor in the below example is `()` or 'list_lit':
            --   '(|)
            -- But the node root is `'()` or 'quoting_lit'
            get_node_root = function()
            end,
            -- This is the inverse of `get_node_root` for forms and should find the inner node for which
            -- the forms elements are direct children.
            --
            -- For example given the node `'()` or 'quoting_lit', this function should return `()` or 'list_lit'.
            unwrap_form = function(_)
            end,
            -- Accepts a Treesitter node and should return true or false depending on whether the given node
            -- can be considered a 'form'
            node_is_form = function(_)
            end,
            -- Accepts a Treesitter node and should return true or false depending on whether the given node
            -- can be considered a 'comment'
            node_is_comment = function(_)
            end,
            -- Accepts a Treesitter node representing a form and should return the 'edges' of the node. This
            -- includes the node text and the range covered by the node
            get_node_edges = function(_)
              return {
                left = { text = "#{", range = { 0, 0, 0, 2 } },
                right = { text = "}", range = { 0, 5, 0, 6 } },
              }
            end,
          }
        },
        keys = {
          -- custom bindings are automatically wrapped
          ["<A-H>"] = { paredit.api.slurp_backwards, "Slurp backwards" },
          ["<A-J>"] = { paredit.api.barf_backwards, "Barf backwards" },
          ["<A-K>"] = { paredit.api.barf_forwards, "Barf forwards" },
          ["<A-L>"] = { paredit.api.slurp_forwards, "Slurp forwards" },
        }
      }
    }
    end,
    init = function()
      vim.g.parinfer_force_balance = true
      vim.g.parinfer_comment_chars = ";;"
      vim.g.parinfer_mode = "smart"
    end,
    lazy=false,
  },
  -- Conjure plugin for Clojure REPL
  {
    "Olical/conjure",
    -- load plugin on filetypes
    ft = { "clojure" , "lisp", "scheme", "edn"},
    init = function()
      vim.g["conjure#log#hud#width"] = 1
      vim.g["conjure#log#hud#enabled"] = false
      vim.g["conjure#log#hud#anchor"] = "SE"
      vim.g["conjure#log#botright"] = true
      vim.g["conjure#extract#context_header_lines"] = 100
      vim.g["conjure#eval#comment_prefix"] = ";; "
      vim.g["conjure#client#clojure#nrepl#connection#auto_repl#enabled"] = false
      vim.g["conjure#client#clojure#nrepl#connection#auto_repl#hidden"] = true
      vim.g["conjure#client#clojure#nrepl#connection#auto_repl#cmd"] = nil
      vim.g["conjure#client#clojure#nrepl#eval#auto_require"] = false
      vim.g["conjure#client#clojure#nrepl#test#runner"] = "kaocha"

      vim.api.nvim_create_autocmd("BufNewFile", {
        group = vim.api.nvim_create_augroup("conjure_log_disable_lsp", { clear = true }),
        pattern = { "conjure-log-*" },
        callback = function() vim.diagnostic.disable(0) end,
        desc = "Conjure Log disable LSP diagnostics",
      })

      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("comment_config", { clear = true }),
        pattern = { "clojure" },
        callback = function() vim.bo.commentstring = ";; %s" end,
        desc = "Lisp style line comment",
      })
    end,
  },
}
