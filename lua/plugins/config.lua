return {
    -- UI
    {"xiyaowong/transparent.nvim", opts={} },
    -- File Explorer
    {"nvim-tree/nvim-tree.lua", opts={}},
    { "nvim-tree/nvim-web-devicons", lazy = true },
    -- Syntax highliter
    {"nvim-treesitter/nvim-treesitter", opts={} },
    -- Depend
    {"nvim-lua/plenary.nvim"},
    -- Comments 
    {'numToStr/Comment.nvim', opts={} },
    -- Folding
    {
      "kevinhwang91/nvim-ufo",
      dependencies ={"kevinhwang91/promise-async"}, opts={}, 
      config = function()
        require("ufo").setup({
          provider_selector = function(bufnr, filetype, buftype)
            return {'treesitter', 'indent'}
          end
        })
      end
    },
    -- Todo
    {
      "folke/todo-comments.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
      opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    },
}
