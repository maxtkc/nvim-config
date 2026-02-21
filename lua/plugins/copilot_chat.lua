return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "zbirenbaum/copilot.lua",
    },
    build = "make tiktoken",
    config = function()
      -- Prevent copilot.lua from mapping Tab
      vim.g.copilot_no_tab_map = true

      -- Setup CopilotChat
      require("CopilotChat").setup({
        panel = {
          enabled = true,
        },
        mappings = {
          close = {
            normal = 'q',
            insert = '<C-c>',
          },
          reset = {
            normal = 'gl',
            insert = 'gl',
          },
          submit_prompt = {
            normal = '<CR>',
            insert = '<C-CR>',
          },
          complete = {
            insert = '<Tab>',
          },
          accept_diff = {
            normal = '<C-y>',
            insert = '<C-y>',
          },
          show_diff = {
            normal = 'gd',
          },
          yank_diff = {
            normal = 'gy',
          },
        },
      })

      -- Manual keymaps for toggle/open/close
      local chat = require("CopilotChat")
      vim.keymap.set("n", "<leader>c", chat.toggle, { desc = "Toggle CopilotChat" })
      vim.keymap.set("n", "<leader>co", ":CopilotChatOpen<CR>", { desc = "Open CopilotChat" })
      vim.keymap.set("n", "<leader>cx", ":CopilotChatClose<CR>", { desc = "Close CopilotChat" })
    end,
  },
}
