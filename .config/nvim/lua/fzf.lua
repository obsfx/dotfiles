local fn  = vim.fn
local cmd = vim.cmd
local utils = require("utils")

-- Use ripgrep for searching
-- https://github.com/junegunn/fzf.vim/blob/master/doc/fzf-vim.txt#L355
function _G.rgfzf(argv, fullscreen)
  local command_args = {
    "--column",
    "--line-number",
    "--no-heading",
    "--color=always",
    "-g=\"!*-lock.json\"",
    "--type-not sql",
    "--smart-case",
  }

  local extra_commands = {}
  local query = ''
  local paramlist = fn.split(argv, " ")

  if paramlist[1] == "--type" then
    extra_commands = utils.slice_table(paramlist, 1, 3)
    query = fn.join(utils.slice_table(paramlist, 3, #paramlist + 1), " ")
  else
    query = fn.join(paramlist, " ")
  end

  local command_fmt = 'rg ' .. fn.join(utils.merge(command_args, extra_commands), ' ') .. ' -- %s || true'
  local initial_command = fn.printf(command_fmt, fn.shellescape(query))
  local reload_command = fn.printf(command_fmt, '{q}')
  local spec = {options = { '--phony', '--query', query, '--bind', 'change:reload:' .. reload_command }}
  fn["fzf#vim#grep"](initial_command, 1, fn["fzf#vim#with_preview"](spec), fullscreen)
end

cmd([[command! -nargs=* -bang RG call v:lua.rgfzf(<q-args>, <bang>0)]])
cmd([[nnoremap <Leader>/ :RG<Space>]])
