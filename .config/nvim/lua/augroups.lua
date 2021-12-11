local cmd = vim.cmd
local fn  = vim.fn

-- remove trailing whitespaces on save
function _G.remove_trailing_ws()
  local saved_cursor_pos = fn.getpos(".")
  cmd([[%s/\s\+$//e]])
  fn.setpos(".", saved_cursor_pos)
end

cmd([[
  augroup rm_trailing_ws
    autocmd!
    autocmd BufWritePre * call v:lua.remove_trailing_ws()
  augroup end

  augroup cls_on_complete_done
    autocmd!
    autocmd CompleteDone * pclose
  augroup end

  augroup resize_equally
    autocmd!
    autocmd VimResized * wincmd =
  augroup end
]])

-- go
cmd([[au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4]])
cmd([[au BufWritePost *.go silent! execute "!gofmt -w %" | e]])
