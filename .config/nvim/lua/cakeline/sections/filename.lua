local M = {}

function M.show(inactive)
  local config = require('cakeline.sections.table').filename.config
  return require("cakeline").section(
    "Filename",
    inactive,
    config.activecolors,
    config.inactivecolors,
    "f",
    true,
    config.leftpadding,
    config.rightpadding
  )
end

return M
