-- ~/.config/nvim/lua/config/statusline.lua
local fn = vim.fn

local function at(str, index) return string.sub(str, index, index) end
local function is_table(obj) return type(obj) == "table" end
local function is_array(obj)
  if not is_table(obj) then return false end
  local i = 0
  for _ in pairs(obj) do
    i = i + 1
    if obj[i] == nil then return false end
  end
  return true
end
local function is_empty(obj) return is_array(obj) and #obj == 0 end

local function slice_table(obj, start, finish)
  if is_empty(obj) or start == finish then return {} end
  local output = {}
  local _finish = #obj
  local _start = 1

  if start >= 0 then
    _start = start
  elseif finish == nil and start < 0 then
    _start = #obj + start + 1
  end

  if finish and finish >= 0 then
    _finish = finish - 1
  elseif finish and finish < 0 then
    _finish = #obj + finish
  end

  for i = _start, _finish do table.insert(output, obj[i]) end
  return output
end

local function substitute_home(path)
  return fn.substitute(path, fn.expand("$HOME"), "~", "")
end

local function shrink_path(path)
  if at(path, 1) == "." then
    return at(path, 1) .. at(path, 2)
  end
  return at(path, 1)
end

function _G.fish_like_path()
  local path = substitute_home(fn.expand("%:p"))
  local paths = fn.split(path, "/")
  local level = 1

  if #paths == 0 then
    return "/"
  elseif #paths == 1 then
    return (paths[1] == "~") and "~/" or path
  end

  local after = slice_table(paths, -(level))
  local before = slice_table(paths, 1, -(level))
  for k, v in pairs(before) do before[k] = shrink_path(v) end
  return fn.join(before, "/") .. "/" .. fn.join(after, "/")
end

local function git_head()
  if fn.exists("*FugitiveHead") == 1 then
    local h = fn.FugitiveHead()
    if h ~= "" then return " (" .. h .. ")" end
  end
  return ""
end

local function diag_counts()
  local b = vim.api.nvim_get_current_buf()
  local s = vim.diagnostic.severity
  local e = #vim.diagnostic.get(b, { severity = s.ERROR })
  local w = #vim.diagnostic.get(b, { severity = s.WARN })
  local i = #vim.diagnostic.get(b, { severity = s.INFO })
  local h = #vim.diagnostic.get(b, { severity = s.HINT })

  local out = {}
  if e > 0 then table.insert(out, (" %dX"):format(e)) end
  if w > 0 then table.insert(out, (" %d!"):format(w)) end
  if i > 0 then table.insert(out, (" %d?"):format(i)) end
  if h > 0 then table.insert(out, (" %d~"):format(h)) end
  return table.concat(out, "")
end

local function lsp_clients()
  local buf = vim.api.nvim_get_current_buf()
  local clients = vim.lsp.get_clients({ bufnr = buf })
  if not clients or #clients == 0 then return "" end

  local names, seen = {}, {}
  for _, c in ipairs(clients) do
    if c.name and not seen[c.name] then
      seen[c.name] = true
      table.insert(names, c.name)
    end
  end
  table.sort(names)
  return " " .. table.concat(names, ",")
end

local _lsp_progress = ""
vim.api.nvim_create_autocmd("User", {
  group = vim.api.nvim_create_augroup("lsp_progress_statusline", { clear = true }),
  pattern = "LspProgress",
  callback = function(ev)
    local data = ev.data
    if not data or not data.params or not data.params.value then
      _lsp_progress = ""
      return
    end
    local v = data.params.value
    local parts = {}
    if type(v.title) == "string" and v.title ~= "" then table.insert(parts, v.title) end
    if type(v.message) == "string" and v.message ~= "" then table.insert(parts, v.message) end
    if type(v.percentage) == "number" then table.insert(parts, tostring(v.percentage) .. "%") end
    local msg = table.concat(parts, " ")
    _lsp_progress = (msg ~= "") and (" " .. msg) or ""
    if v.kind == "end" then
      vim.defer_fn(function() _lsp_progress = "" end, 150)
    end
  end,
})

local function lsp_progress() return _lsp_progress end

function _G.statusline()
  local enc = (vim.bo.fileencoding ~= "" and vim.bo.fileencoding) or vim.o.encoding
  local ff = vim.bo.fileformat

  local left = table.concat({
    _G.fish_like_path(),
    " %m",
  }, "")

  local right = table.concat({
    lsp_progress(),
    lsp_clients(),
    diag_counts(),
    " " .. enc,
    " [" .. ff .. "]",
    " %l/%L:%c",
    " %p%%",
    git_head(),
    " ",
  }, "")

  return left .. "%=" .. right .. "%<"
end

vim.opt.statusline = "%!v:lua.statusline()"
