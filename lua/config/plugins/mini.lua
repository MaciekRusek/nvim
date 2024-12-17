return {
  {
    'echasnovski/mini.nvim',
    config = function()
      local statusline = require 'mini.statusline'
      local completion = require 'mini.completion'
      local pairs = require 'mini.pairs'

      statusline.setup { use_icons = true }
      completion.setup {}
      pairs.setup {}
    end

  }
}

