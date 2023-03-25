require 'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "javascript",
    "typescript",
    "c",
    "python",
    "css",
    "scss",
    "go",
    "json",
    "commonlisp",
    "lua",
    "tsx",
    "html",
    "graphql",
    "bash",
    "vue",
    "vim",
    "svelte"
  },

  highlight = {
    enable = true,
    --disable = { "go" },
  },
  auto_install = true,
}
