require'nvim-treesitter.configs'.setup {
ensure_installed = {
    "javascript",
    "typescript",
    "c",
    "go",
    "python",
    "css",
    "scss",
    "json",
    "commonlisp",
    "lua",
    --"tsx",
    "html",
    "graphql",
    "bash",
    "vue",
    "vim"
  },
  highlight = {enable = true},
  query_linter = {enable = true, use_virtual_text = true, lint_events = {"BufWrite", "CursorHold"}},
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
  },
}
