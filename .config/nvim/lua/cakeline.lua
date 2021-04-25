local M = {
  tokens = {}
}
local wo = vim.wo
local cmd = vim.cmd
local api = vim.api
local fn = vim.fn

function M.setline(line)
  local tokens = {}
  local startidx = nil
  local sections = require('cakeline.sections.table');

  for i = 1, #line do
    local c = line:sub(i, i)

    if c == '{' and startidx == nil then
      i = i + 1
      startidx = i
    elseif c == '}' and startidx ~= nil then
      local sectionkey = line:sub(startidx, i - 1);
      tokens[#tokens+1] = sections[sectionkey].show
      startidx = nil
    elseif startidx == nil then
      tokens[#tokens+1] = function(_)
        return c
      end
    end
  end

  M.tokens = tokens
end

function M.register(key, config, exp, native)
  require("cakeline.sections.table")[key] = {}
  require("cakeline.sections.table")[key].config = config
  require("cakeline.sections.table")[key].show = function(inactive)
    local config = require("cakeline.sections.table")[key].config
    return M.section(
        key,
        inactive,
        config.activecolors,
        config.inactivecolors,
        exp,
        native,
        config.leftpadding,
        config.rightpadding
      )
  end
end

function M.section(name, inactive, active_color, inactive_color, exp, native, lp, rp)
  local color = active_color
  if inactive then color = inactive_color end
  cmd(require('cakeline.hi').build_hi(name, color.bg, color.fg, color.gui, inactive))
  local hi = require('cakeline.hi').build_name(name, inactive)
  return require('cakeline.hi').build_section(hi, exp, native, lp, rp)
end

function M.build(inactive)
  local _slconfig = require('cakeline.sections.table')._sl.config;
  cmd(require('cakeline.hi').build_hi_wo_ns("StatusLine", _slconfig.activecolors.bg, _slconfig.activecolors.fg, _slconfig.activecolors.gui))
  cmd(require('cakeline.hi').build_hi_wo_ns("StatusLineNC", _slconfig.inactivecolors.bg, _slconfig.inactivecolors.fg, _slconfig.inactivecolors.gui))

  local sl = {}
  for i = 1, #M.tokens do
    sl[#sl+1] = M.tokens[i](inactive)
  end
  sl[#sl+1] = '%<'
  return table.concat(sl)
end

function M.update()
  local curwin = fn.winnr()
  local totalwin = fn.winnr('$')
  for i = 1, totalwin do
    fn.setwinvar(i, '&statusline', M.build(i ~= curwin))
  end
end

api.nvim_exec([[
  augroup cakeline
    autocmd!
    autocmd WinEnter,BufEnter,BufDelete,SessionLoadPost,FileChangedShellPost * lua require("cakeline").update()
  augroup end
]], false)

return M
