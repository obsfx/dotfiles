local cakeline = require("cakeline")

local active = {bg = '#262626', fg = '#888888'}
local inactive = {bg = '#1d1d1d', fg = '#444444'}

-- fishpath
cakeline.register("fp", {
  leftpadding = 0,
  rightpadding = 0,
  activecolors = {bg = active.bg, fg = active.fg, gui = 'NONE'},
  inactivecolors = {bg = inactive.bg, fg = inactive.fg, gui = 'NONE'}
}, 'GetFishLikePath(expand("%:p"), 1)', false)

-- modfied
cakeline.register("md", {
  leftpadding = 0,
  rightpadding = 0,
  activecolors = {bg = active.bg, fg = '#ffc24b', gui = 'BOLD'},
  inactivecolors = {bg = inactive.bg, fg = inactive.fg, gui = 'BOLD'}
}, 'Modified()', false)

-- coc status
cakeline.register("cs", {
  leftpadding = 0,
  rightpadding = 0,
  activecolors = {bg = active.bg, fg = active.fg, gui = 'NONE'},
  inactivecolors = {bg = inactive.bg, fg = inactive.fg, gui = 'NONE'}
}, "CocStatus()", false)

-- coc error
cakeline.register("ce", {
  leftpadding = 0,
  rightpadding = 0,
  activecolors = {bg = active.bg, fg = '#f43753', gui = 'NONE'},
  inactivecolors = {bg = inactive.bg, fg = inactive.fg, gui = 'NONE'}
}, "CocStatusField('error', 'X')", false)

-- coc warning
cakeline.register("cw", {
  leftpadding = 0,
  rightpadding = 0,
  activecolors = {bg = active.bg, fg = '#ffc24b', gui = 'NONE'},
  inactivecolors = {bg = inactive.bg, fg = inactive.fg, gui = 'NONE'}
}, "CocStatusField('warning', '!')", false)

-- coc info
cakeline.register("ci", {
  leftpadding = 0,
  rightpadding = 0,
  activecolors = {bg = active.bg, fg = '#ffd178', gui = 'NONE'},
  inactivecolors = {bg = inactive.bg, fg = inactive.fg, gui = 'NONE'}
}, "CocStatusField('information', '?')", false)

-- fileformat
cakeline.register("ff", {
  leftpadding = 0,
  rightpadding = 0,
  activecolors = {bg = active.bg, fg = active.fg, gui = 'NONE'},
  inactivecolors = {bg = inactive.bg, fg = inactive.fg, gui = 'NONE'}
}, '&ff', false)

-- encoding
cakeline.register("enc", {
  leftpadding = 0,
  rightpadding = 0,
  activecolors = {bg = active.bg, fg = active.fg, gui = 'NONE'},
  inactivecolors = {bg = inactive.bg, fg = inactive.fg, gui = 'NONE'}
}, 'strlen(&fenc)?&fenc:&enc', false)

-- linenumber
cakeline.register("ln", {
  leftpadding = 0,
  rightpadding = 0,
  activecolors = {bg = active.bg, fg = '#eeeeee', gui = 'BOLD'},
  inactivecolors = {bg = inactive.bg, fg = inactive.fg, gui = 'BOLD'}
}, 'LineNum()', false)

-- columnnumber
cakeline.register("cl", {
  leftpadding = 0,
  rightpadding = 0,
  activecolors = {bg = active.bg, fg = active.fg, gui = 'NONE'},
  inactivecolors = {bg = inactive.bg, fg = inactive.fg, gui = 'NONE'}
}, 'c', true)

-- percentage
cakeline.register("per", {
  leftpadding = 0,
  rightpadding = 0,
  activecolors = {bg = active.bg, fg = active.fg, gui = 'NONE'},
  inactivecolors = {bg = inactive.bg, fg = inactive.fg, gui = 'NONE'}
}, 'p%%', true)

-- githead
cakeline.register("gh", {
  leftpadding = 0,
  rightpadding = 0,
  activecolors = {bg = '#282828', fg = '#eeeeee', gui = 'NONE'},
  inactivecolors = {bg = active.bg, fg = inactive.fg, gui = 'NONE'}
}, 'GitHead()', false)

local statusline = " {fp} {md} {switchright}{cs}{ce}{cw}{ci} {ff} [{enc}] ~ {ln}:{cl} {per} {gh}"
cakeline.setline(statusline)

