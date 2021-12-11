local M = {}

function M.merge(f, s)
  for k,v in pairs(s) do f[k] = v end
  return f
end

function M.at(str, index)
  return string.sub(str, index, index)
end

function M.is_table(obj)
  return type(obj) == "table"
end

function M.is_array(obj)
  if not M.is_table(obj) then return false end

  local i = 0
  for _ in pairs(obj) do
    i = i + 1
    if obj[i] == nil then return false end
  end

  return true
end

function M.is_empty(obj)
  return M.is_array(obj) and #obj == 0 end

function M.is_nil(value)
  return value == nil
end

function M.slice_table(obj, start, finish)
  if M.is_empty(obj) or start == finish then return {} end

  local output = {}
  local _finish = #obj
  local _start = 1

  if start >= 0 then
    _start = start
  elseif M.is_nil(finish) and start < 0 then
    _start = #obj + start + 1
  end

  if (finish and finish >= 0) then
    _finish = finish - 1
  elseif finish and finish < 0 then
    _finish = #obj + finish
  end

  for i = _start, _finish do table.insert(output, obj[i]) end

  return output
end

function M.substitute_home(path)
  return vim.fn.substitute(path, vim.fn.expand("$HOME"), "~", "")
end

function M.shrink_path(path)
  if M.at(path, 1) == "." then
    return M.at(path, 1) .. M.at(path, 2)
  else
    return M.at(path, 1)
  end
end

return M
