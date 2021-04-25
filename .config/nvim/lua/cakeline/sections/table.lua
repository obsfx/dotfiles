local table = {
  _sl = {
    config = {
      activecolors = {bg = '#262626', fg = '#888888', gui = 'NONE'},
      inactivecolors = {bg = '#1d1d1d', fg = '#444444', gui = 'NONE'}
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
        ['no'] = {bg = '#F4DC8C', fg = '#282828', gui = 'BOLD'},
        ['v'] = {bg = '#E1ECF3', fg = '#282828', gui = 'BOLD'},
        ['V'] = {bg = '#E1ECF3', fg = '#282828', gui = 'BOLD'},
        [''] = {bg = '#E1ECF3', fg = '#282828', gui =  'BOLD'},
        ['s'] = {bg = '#F4DC8C', fg = '#282828', gui = 'BOLD'},
        ['S'] = {bg = '#F4DC8C', fg = '#282828', gui = 'BOLD'},
        [''] = {bg = '#F4DC8C', fg = '#282828', gui = 'BOLD'},
        ['i'] = {bg = '#E1ECF3', fg = '#282828', gui = 'BOLD'},
        ['R'] = {bg = '#F4DC8C', fg = '#282828', gui = 'BOLD'},
        ['Rv'] = {bg = '#E1ECF3', fg = '#282828', gui = 'BOLD'},
        ['c'] = {bg = '#F4DC8C', fg = '#282828', gui = 'BOLD'},
        ['cv'] = {bg = '#F4DC8C', fg = '#282828', gui = 'BOLD'},
        ['ce'] = {bg = '#F4DC8C', fg = '#28', gui = 'BOLD'},
        ['r'] = {bg = '#F4DC8C', fg = '#282828', gui = 'BOLD'},
        ['rm'] = {bg = '#F4DC8C', fg = '#282828', gui = 'BOLD'},
        ['r?'] = {bg = '#F4DC8C', fg = '#282828', gui = 'BOLD'},
        ['!'] = {bg = '#F4DC8C', fg = '#282828', gui = 'BOLD'},
        ['t'] = {bg = '#F4DC8C', fg = '#282828', gui = 'BOLD'},
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
      inactivecolors = {bg = '#1d1d1d', fg = '#444444', gui = 'NONE'}
    },
    show = require('cakeline.sections.filename').show
  }
}

return table
