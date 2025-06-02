local servers = { "html", "cssls", "pyright", "lua_ls", "clangd", "texlab" }
vim.lsp.enable(servers)

M = require "lspconfig"

M.pyright.setup {}
M.lua_ls.setup {}
M.clangd.setup {}
M.texlab.setup {}
