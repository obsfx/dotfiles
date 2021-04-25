local table = {
  _sl = {
    config = {
      activecolors = {bg = '#222222', fg = '#777777', gui = 'NONE'},
      inactivecolors = {bg = '#1c1b1a', fg = '#444444', gui = 'NONE'}
    }
  },
  switchright = {
    show = function(inactive)
      return "%= "
    end
  },
  mode = {
    config = {
      leftpadding = 1,
      rightpadding = 1,
      colormap = {
        ['n'] = {bg = '#282828', fg = '#eeeeee', gui = 'BOLD'},
        ['no'] = {bg = '#CF2549', fg = '#eeeeee', gui = 'BOLD'},
        ['v'] = {bg = '#E1ECF3', fg = '#282828', gui = 'BOLD'},
        ['V'] = {bg = '#E1ECF3', fg = '#282828', gui = 'BOLD'},
        [''] = {bg = '#E1ECF3', fg = '#282828', gui =  'BOLD'},
        ['s'] = {bg = '#CF2549', fg = '#eeeeee', gui = 'BOLD'},
        ['S'] = {bg = '#CF2549', fg = '#eeeeee', gui = 'BOLD'},
        [''] = {bg = '#CF2549', fg = '#eeeeee', gui = 'BOLD'},
        ['i'] = {bg = '#1CACF4', fg = '#282828', gui = 'BOLD'},
        ['R'] = {bg = '#CF2549', fg = '#eeeeee', gui = 'BOLD'},
        ['Rv'] = {bg = '#E1ECF3', fg = '#282828', gui = 'BOLD'},
        ['c'] = {bg = '#CF2549', fg = '#eeeeee', gui = 'BOLD'},
        ['cv'] = {bg = '#CF2549', fg = '#eeeeee', gui = 'BOLD'},
        ['ce'] = {bg = '#CF2549', fg = '#eeeeee', gui = 'BOLD'},
        ['r'] = {bg = '#CF2549', fg = '#eeeeee', gui = 'BOLD'},
        ['rm'] = {bg = '#CF2549', fg = '#eeeeee', gui = 'BOLD'},
        ['r?'] = {bg = '#CF2549', fg = '#eeeeee', gui = 'BOLD'},
        ['!'] = {bg = '#CF2549', fg = '#eeeeee', gui = 'BOLD'},
        ['t'] = {bg = '#CF2549', fg = '#eeeeee', gui = 'BOLD'},
        ['inactive'] = {bg = '#1c1b1a', fg = '#444444', gui = 'BOLD'}
      }
    },
    update = require('cakeline.sections.mode').mode,
    show = require('cakeline.sections.mode').show
  },
  filename = {
    config = {
      leftpadding = 1,
      rightpadding = 0,
      activecolors = {bg = '#222222', fg = '#777777', gui = 'NONE'},
      inactivecolors = {bg = '#1c1b1a', fg = '#444444', gui = 'NONE'}
    },
    show = require('cakeline.sections.filename').show
  }
}

return table
