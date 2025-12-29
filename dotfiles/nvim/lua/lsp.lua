-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local servers = { 'clangd', 'pyright', 'ts_ls', 'html', 'cssls', 'jsonls', 'null_ls' }

for _, lsp in ipairs(servers) do
  vim.lsp.config(lsp, { capabilities = capabilities })
end

-- Use Conda environment for Python
local function get_python()
    local prefix = vim.env.CONDA_PREFIX
    if prefix then
        return prefix .. "/bin/python"
    end
    return vim.fn.exepath("python")
end

vim.lsp.config('pyright', {
    settings = {
        python = {
            pythonPath = get_python(),
        },
    },
})

vim.lsp.enable('pyright')
vim.lsp.enable('clangd')
vim.lsp.enable('ts_ls')
vim.lsp.enable('html')
vim.lsp.enable('cssls')
vim.lsp.enable('jsonls')
vim.lsp.enable('null_ls')
