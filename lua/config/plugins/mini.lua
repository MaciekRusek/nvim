return {
  {
    'echasnovski/mini.nvim',
    config = function()
      -- local statusline = require 'mini.statusline'
      local pairs = require 'mini.pairs'
      local completion = require 'mini.completion'

      -- statusline.setup { use_icons = true }
      pairs.setup {}
      completion.setup {}
    end

  }
}
