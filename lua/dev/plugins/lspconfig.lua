-- Set up LSP servers using nvim-lspconfig
--local lspconfig = require('lspconfig')
--local servers = { 'ts_ls' }
--for _, lsp in ipairs(servers) do
--  lspconfig[lsp].setup({
--    on_attach = function(_, bufnr)
--      vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
--      vim.api.nvim_buf_set_option(bufnr, 'tagfunc', 'v:lua.vim.lsp.tagfunc')
--    end
--  })
--end

-- Define the ts_ls configuration (nvim 0.11)
vim.lsp.config.ts_ls = {
  on_attach = function(_, bufnr)
    -- Your custom logic here (optional)
    -- The omnifunc and tagfunc are set by default
  end
}

-- Enable the TypeScript language server
vim.lsp.enable("ts_ls")
