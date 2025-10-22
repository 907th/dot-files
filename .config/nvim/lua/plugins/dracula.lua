return {
  {
    "Mofiqul/dracula.nvim", -- Add dracula colorscheme.
    config = function()
      local dracula = require("dracula")
      dracula.setup({
        colors = {
          comment = "#bcc3d8", -- Use lighter color for comments for better readability.
        },
      })
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "dracula", -- Configure LazyVim to use dracula colorscheme.
    },
  },
}
