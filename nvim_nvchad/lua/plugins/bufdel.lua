local map = vim.keymap.set

map("n", "<leader>bd", "<cmd>BufDel<cr>", { desc = "buffer delete"})
map("n", "<leader>ba", "<cmd>BufDelAll<cr>", { desc = "buffer delete all"})
map("n", "<leader>bo", "<cmd>BufDelOthers<cr>", { desc = "buffer delete others"})

return {
      "ojroques/nvim-bufdel",
      lazy = false,
}
