return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,       -- load immediately
    priority = 1000,    -- load before other plugins
    opts = {
      flavour = "mocha",                -- options: latte, frappe, macchiato, mocha
      transparent_background = false,
      term_colors = true,
      integrations = {
        treesitter = true,              -- enable Treesitter integration
      },
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
