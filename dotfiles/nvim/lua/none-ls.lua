local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    -- C/C++
    null_ls.builtins.formatting.clang_format,
    -- Java
    null_ls.builtins.formatting.google_java_format,
    -- HTML/CSS/JS
    null_ls.builtins.formatting.prettierd,
    -- Bash
    null_ls.builtins.formatting.shfmt,
    -- Markdown
    null_ls.builtins.formatting.markdownlint,
  },
  on_attach = function(client, bufnr)
  end,
})
