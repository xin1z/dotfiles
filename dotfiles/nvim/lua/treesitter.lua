require('nvim-treesitter.configs').setup {
  ensure_installed = { "c", "cpp", "python", "javascript", "css", "java", "json", "typescript", "html", "lua", "markdown", "markdown_inline" },
  sync_install = true,
  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
