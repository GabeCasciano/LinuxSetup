require "nvchad.autocmds"

vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*.md",
  callback = function()
    local full_path = vim.fn.expand "%:p"
    -- Print to verify it runs — remove this line once confirmed
    vim.fn.jobstart({ "markdown_live", full_path, "-p 9999" }, {
      detach = true,
      stdout_buffered = true,
      stderr_buffered = true,
    })
  end,
})
