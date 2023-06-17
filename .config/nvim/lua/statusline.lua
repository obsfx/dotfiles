local set = vim.o
local utils = require("utils")

-- fish like path and utils https://github.com/usirin/init.lua
function _G.fish_like_path()
  local paths = vim.fn.split(utils.substitute_home(vim.fn.expand("%:p")), "/")
  local level = 1

  if #paths == 0 then
    return "/"
  elseif #paths == 1 then
    if paths[1] == "~" then
      return "~/"
    else
      return path
    end
  end

  local after = utils.slice_table(paths, -(level))
  local before = utils.slice_table(paths, 1, -(level))

  for key, value in pairs(before) do before[key] = utils.shrink_path(value) end

  return vim.fn.join(before, "/") .. "/" .. vim.fn.join(after, "/")
end

vim.cmd([[
  function! CocStatus() abort
    let status = get(g:, 'coc_status', '')
    if empty(status) | return '' | endif
    return ' ' .. status
  endfunction

  " Coc.nvim status builder
  function! CocStatusField(key, sym) abort
    let info = get(b:, 'coc_diagnostic_info', {})
    if empty(info) | return '' | endif
    if get(info, a:key, 0) | return '  ' .. info[a:key] . a:sym | endif
    return ''
  endfunction
]])

-- get git head
function _G.git_head()
  local h = vim.fn["FugitiveHead"]()
  if h ~= "" then
    return " (" .. h .. ") "
  end
  return ""
end

set.statusline = ""
set.statusline = set.statusline .. "%{v:lua.fish_like_path()}"
set.statusline = set.statusline .. " %m"
set.statusline = set.statusline .. "%="
set.statusline = set.statusline .. "%{CocStatus()}"
set.statusline = set.statusline .. "%{CocStatusField('error','X')}"
set.statusline = set.statusline .. "%{CocStatusField('warning','!')}"
set.statusline = set.statusline .. "%{CocStatusField('information','?')}"
set.statusline = set.statusline .. " %{&fileencoding?&fileencoding:&encoding}"
set.statusline = set.statusline .. " [%{&fileformat}]"
set.statusline = set.statusline .. " %l/%L:%c"
set.statusline = set.statusline .. " %p%%"
set.statusline = set.statusline .. " %{v:lua.git_head()}"
set.statusline = set.statusline .. "%<"

-- set.statusline = "f%f - F%F - t%t - m%m - M%M - r%r - R%R - h%h - H%H - w%w - W%W - y%y - Y%Y - q%q - k%k - n%n - b%b - B%B"
