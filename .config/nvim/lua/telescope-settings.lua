local actions = require("telescope.actions")

require("telescope").setup{
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
  }
}
