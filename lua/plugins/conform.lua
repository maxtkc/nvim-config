return {
  {
    "stevearc/conform.nvim",
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          python = { "isort", "black" },
        },
      })

      vim.keymap.set({ "n", "v" }, "<leader>f", function()
        require("conform").format({ async = true })
      end, { noremap = true, silent = true, desc = "Format file/selection" })
    end,
  },
}
