return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      -- Set up keymaps whenever an LSP client attaches
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local bufnr = args.buf
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          local opts = { noremap = true, silent = true, buffer = bufnr }
          local keymap = vim.keymap.set

          keymap("n", "K", vim.lsp.buf.hover, opts)
          keymap("n", "<C-k>", vim.lsp.buf.signature_help, opts)

          keymap("n", "gd", vim.lsp.buf.definition, opts)
          keymap("n", "gD", vim.lsp.buf.declaration, opts)
          keymap("n", "gr", vim.lsp.buf.references, opts)
          keymap("n", "gi", vim.lsp.buf.implementation, opts)

          keymap("n", "<leader>e", vim.diagnostic.open_float, opts)
          keymap("n", "[d", vim.diagnostic.goto_prev, opts)
          keymap("n", "]d", vim.diagnostic.goto_next, opts)
          keymap("n", "<leader>q", vim.diagnostic.setloclist, opts)

          keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)
          keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)

          -- Restore gq to native Vim behaviour (LSP overwrites formatexpr)
          vim.bo[bufnr].formatexpr = nil

          -- Disable Ruff hover to avoid conflicts with Pyright
          if client and client.name == "ruff" then
            client.server_capabilities.hoverProvider = false
          end
        end,
      })

      -- lspconfig provides cmd/filetypes/root_markers; vim.lsp.enable activates them
      vim.lsp.enable("pyright")
      vim.lsp.enable("ruff")
    end,
  },
}
