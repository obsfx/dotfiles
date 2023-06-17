local actions = require("telescope.actions")

require("telescope").setup {
  defaults = {
    --preview = false,
    layout_config = {
      vertical = { width = 1 }
    },
    mappings = {
      i = {
        ["<esc>"] = actions.close
      },
    },
    file_ignore_patterns = { "./node_modules/*", "node_modules", "^node_modules/*", "node_modules/*" }
  },
  pickers = {
    find_files = {
      disable_devicons = true
    },
    live_grep = {
      disable_devicons = true
    },
  },
}

require('telescope').load_extension('coc')
