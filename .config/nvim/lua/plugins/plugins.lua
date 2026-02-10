return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "dracula", -- Configure LazyVim to use "dracula" colorscheme.
    },
  },
  {
    "Mofiqul/dracula.nvim",
    opts = {
      colors = {
        comment = "lightgray", -- Use lighter color for comments for better readability.
      },
      overrides = {
        WinSeparator = { fg = "lightgray" }, -- Use lighter color for windows separator for better visibility.
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false }, -- Do not show code hints (e.g. func argument names in Go lang).
    },
  },
  {
    "nvim-mini/mini.pairs",
    enabled = false, -- Do not autocomplete brackets, etc.
  },
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          explorer = {
            jump = { close = true },
            matcher = { fuzzy = true },
          },
        },
      },
    },
  },
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        sort_by = "id", -- Sort by buffer number, which roughly corresponds to open sequence.
      },
    },
  },
  {
    "folke/trouble.nvim",
    opts = {
      win = {
        size = 0.3, -- Use 50 for fixed width, or 0.3 for 30%.
      },
    },
  },
  -- {
  --   "leoluz/nvim-dap-go",
  --   config = function()
  --     require("dap-go").setup({
  --       dap_configurations = {
  --         {
  --           type = "go",
  --           name = "My Custom Test Debug",
  --           request = "launch",
  --           mode = "test",
  --           program = "./app/fluidsearch/tests/api/",
  --           env = {
  --             TEST_DATABASE = "postgres://user:user@localhost:6432/fluidsearch?sslmode=disable",
  --           },
  --           args = { "-test.run", "UserDefined" },
  --         },
  --       },
  --     })
  --   end,
  -- },
}
