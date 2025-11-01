return {
  {
    -- "leonardo-luz/quicknotes.nvim",
    dir = '~/documents/code/git/misc/lua/quicknotes.nvim',
    opts = {
      custom_path = "/home/leonardo-luz/documents/notes/Quicknotes",
      keys = {
        { 'n', '<leader>nn', '<cmd>QuicknoteNew<cr>',    { desc = "Quick [N]ote [N]ew " } },
        { 'n', '<leader>np', '<cmd>Quicknote<cr>',       { desc = "Quick [N]ote [P]revious" } },
        { 'n', '<leader>nd', '<cmd>QuicknoteDelete<cr>', { desc = "Quick [N]ote [D]elete List" } },
        { 'n', '<leader>nl', '<cmd>QuicknoteList<cr>',   { desc = "Quick [N]ote [L]ist" } },
      },
    },
  }
}
