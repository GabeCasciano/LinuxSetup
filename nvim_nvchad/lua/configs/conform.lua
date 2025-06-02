local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "black" },
    c = { "clang-format" },
    latex = { "tex-fmt" },
    -- css = { "prettier" },
    -- html = { "prettier" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
