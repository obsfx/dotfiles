local M = {}
local hi_table = {}
local hi_namespace = 'Cakeline'
local hi_inactive_prefix = 'Inactive'

function M.build_section(hl, exp, native, lp, rp)
  local str = ''
  local leftpadding = ''
  local rightpadding = ''

  if hl ~= nil then
    str = '%#' .. hl .. '#'
  end

  if lp and type(lp) == 'number' and lp > 0 then
    leftpadding = '%-' .. lp .. '{" "}'
  end

  if rp and type(rp) == 'number' and rp > 0 then
    rightpadding = '%-' .. rp .. '{" "}'
  end

  if native then
    str = str .. leftpadding .. '%' .. exp .. rightpadding .. '%*'
  else
    str = str .. leftpadding .. '%{' .. exp .. '}' .. rightpadding ..'%*'
  end
  return str
end

function M.build_hi(name, guibg, guifg, gui, inactive)
  local hi_name = M.build_name(name, inactive)
  return 'hi ' .. hi_name .. ' guibg=' .. guibg .. ' guifg=' .. guifg .. ' gui=' .. gui
end

function M.build_hi_wo_ns(name, guibg, guifg, gui)
  return 'hi ' .. name .. ' guibg=' .. guibg .. ' guifg=' .. guifg .. ' gui=' .. gui
end

function M.build_name(name, inactive)
  local hi_name = hi_namespace .. name
  if inactive then
    hi_name = hi_name .. hi_inactive_prefix
  end
  return hi_name
end

return M
