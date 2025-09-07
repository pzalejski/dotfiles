return {
    enabled = true,
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        local bufferline = require('bufferline')
        bufferline.setup({
            options = {
                style_preset = bufferline.style_preset.minimal,
                indicator = { style = 'none' },
                numbers = 'buffer_id',
                show_buffer_icons = false,
                show_buffer_close_icons = false,
                separator_style = 'slope'
            }
        })
    end
}
