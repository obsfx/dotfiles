local M = {}
local cmd = vim.cmd
local fn = vim.fn

local mode_map = {
	['n'] = 'normal',
	['no'] = 'noperator pending',
	['v'] = 'visual',
	['V'] = 'vline',
	[''] = 'vblock',
	['s'] = 'select',
	['S'] = 'sline',
	[''] = 'sblock',
	['i'] = 'insert',
  ['R'] = 'replace',
	['Rv'] = 'vreplace',
	['c'] = 'command',
	['cv'] = 'vim ex',
	['ce'] = 'ex',
	['r'] = 'prompt',
	['rm'] = 'more',
	['r?'] = 'confirm',
	['!'] = 'shell',
	['t'] = 'terminal'
}

function M.mode()
  local mode_key = fn.mode()
  local config = require('cakeline.sections.table').mode.config;
  local mode_color = config.colormap[mode_key]
  if inactive then mode_color = config.colormap['inactive'] end
  cmd(require('cakeline.hi').build_hi('Mode', mode_color.bg, mode_color.fg, mode_color.gui, inactive))
  return string.upper(mode_map[mode_key])
end

function M.show(inactive)
  if inactive then return '%{""}' end
  local config = require('cakeline.sections.table').mode.config;
  local hi = require('cakeline.hi').build_name('Mode', inactive)
  local exp = [[luaeval('require("cakeline.sections.mode").mode()')]]
  return require('cakeline.hi').build_section(hi, exp, false, config.leftpadding, config.rightpadding)
end

return M
