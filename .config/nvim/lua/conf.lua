local cakeline = require("cakeline")

-- fishpath
cakeline.register("fp", {
  leftpadding = 0,
  rightpadding = 0,
  activecolors = {bg = '#222222', fg = '#777777', gui = 'NONE'},
  inactivecolors = {bg = '#1c1b1a', fg = '#444444', gui = 'NONE'}
}, 'GetFishLikePath(expand("%:p"), 1)', false)

-- modfied
cakeline.register("md", {
  leftpadding = 0,
  rightpadding = 0,
  activecolors = {bg = '#222222', fg = '#ffc24b', gui = 'BOLD'},
  inactivecolors = {bg = '#1c1b1a', fg = '#444444', gui = 'BOLD'}
}, 'Modified()', false)

-- coc status
cakeline.register("cs", {
  leftpadding = 0,
  rightpadding = 0,
  activecolors = {bg = '#222222', fg = '#777777', gui = 'NONE'},
  inactivecolors = {bg = '#1c1b1a', fg = '#444444', gui = 'NONE'}
}, "CocStatus()", false)

-- coc error
cakeline.register("ce", {
  leftpadding = 0,
  rightpadding = 0,
  activecolors = {bg = '#222222', fg = '#f43753', gui = 'NONE'},
  inactivecolors = {bg = '#1c1b1a', fg = '#444444', gui = 'NONE'}
}, "CocStatusField('error', 'X')", false)

-- coc warning
cakeline.register("cw", {
  leftpadding = 0,
  rightpadding = 0,
  activecolors = {bg = '#222222', fg = '#ffc24b', gui = 'NONE'},
  inactivecolors = {bg = '#1c1b1a', fg = '#444444', gui = 'NONE'}
}, "CocStatusField('warning', '!')", false)

-- coc info
cakeline.register("ci", {
  leftpadding = 0,
  rightpadding = 0,
  activecolors = {bg = '#222222', fg = '#ffd178', gui = 'NONE'},
  inactivecolors = {bg = '#1c1b1a', fg = '#444444', gui = 'NONE'}
}, "CocStatusField('information', '?')", false)

-- fileformat
cakeline.register("ff", {
  leftpadding = 0,
  rightpadding = 0,
  activecolors = {bg = '#222222', fg = '#777777', gui = 'NONE'},
  inactivecolors = {bg = '#1c1b1a', fg = '#444444', gui = 'NONE'}
}, '&ff', false)

-- encoding
cakeline.register("enc", {
  leftpadding = 0,
  rightpadding = 0,
  activecolors = {bg = '#222222', fg = '#777777', gui = 'NONE'},
  inactivecolors = {bg = '#1c1b1a', fg = '#444444', gui = 'NONE'}
}, 'strlen(&fenc)?&fenc:&enc', false)

-- linenumber
cakeline.register("ln", {
  leftpadding = 0,
  rightpadding = 0,
  activecolors = {bg = '#222222', fg = '#eeeeee', gui = 'BOLD'},
  inactivecolors = {bg = '#1c1b1a', fg = '#444444', gui = 'BOLD'}
}, 'LineNum()', false)

-- columnnumber
cakeline.register("cl", {
  leftpadding = 0,
  rightpadding = 0,
  activecolors = {bg = '#222222', fg = '#777777', gui = 'NONE'},
  inactivecolors = {bg = '#1c1b1a', fg = '#444444', gui = 'NONE'}
}, 'c', true)

-- githead
cakeline.register("gh", {
  leftpadding = 0,
  rightpadding = 0,
  activecolors = {bg = '#282828', fg = '#eeeeee', gui = 'NONE'},
  inactivecolors = {bg = '#1c1b1a', fg = '#444444', gui = 'NONE'}
}, 'GitHead()', false)

local statusline = "{mode} {fp} {md} {switchright}{cs}{ce}{cw}{ci} {ff} [{enc}] • {ln}:{cl} {gh}"
cakeline.setline(statusline)

