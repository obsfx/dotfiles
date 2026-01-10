-- ~/.config/nvim/lua/config/autocmds.lua
vim.cmd([[
  augroup resize_equally
    autocmd!
    autocmd VimResized * wincmd =
  augroup end
]])

vim.cmd([[
  augroup set_tab_size_for_go_files
    autocmd!
    autocmd BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4
  augroup end
]])

vim.cmd([[
  augroup set_tab_size_for_js_files
    autocmd!
    autocmd BufNewFile,BufRead *.js,*.jsx,*.ts,*.tsx,*.svelte setlocal et ts=2 sw=2 sts=2
  augroup end
]])

-- netrw safety
vim.g.netrw_banner = 0
vim.cmd([[
  function! Netrw_NOP(islocal) abort
    return ''
  endfunction
]])
vim.g.Netrw_UserMaps = {
  { "D", "Netrw_NOP" },
  { "H", "Netrw_NOP" },
  { "J", "Netrw_NOP" },
  { "K", "Netrw_NOP" },
  { "L", "Netrw_NOP" },
}
