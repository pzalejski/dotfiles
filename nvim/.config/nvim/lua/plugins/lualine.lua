vim.pack.add({
    { src = 'https://github.com/nvim-lualine/lualine.nvim' }
})

local colors = {
    blue   = '#95b1ac',
    cyan   = '#9ccfd8',
    -- black  = '#080808',
    black  = '#11724',
    -- white  = '#e0def4',
    white  = '#ebbcba',
    red    = '#eb6f92',
    -- violet = '#c4a7e7',
    violet = '#d4a8a6',
    grey   = '#26233a',
}

local bubbles_theme = {
    normal = {
        a = { fg = colors.grey, bg = colors.violet },
        b = { fg = colors.white, bg = colors.grey },
        c = { fg = colors.white },
        z = { fg = colors.grey, bg = colors.violet }
    },

    insert = { a = { fg = colors.grey, bg = colors.blue } },
    visual = { a = { fg = colors.grey, bg = colors.cyan } },
    replace = { a = { fg = colors.grey, bg = colors.red } },

    inactive = {
        a = { fg = colors.white, bg = colors.black },
        b = { fg = colors.white, bg = colors.black },
        c = { fg = colors.white },
    },
}

require('lualine').setup {
    options = {
        theme = bubbles_theme,
        component_separators = '',
        section_separators = { left = '', right = '' },
    },
    sections = {
        lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
        lualine_b = { 'filename', 'branch' },
        lualine_c = {
            -- '%=', --[[ add your center components here in place of this comment ]]
            'diagnostics'
        },
        lualine_x = {},
        lualine_y = { 'filetype', 'progress' },
        lualine_z = {
            { 'location', separator = { right = '' }, left_padding = 2 },
        },
    },
    inactive_sections = {
        lualine_a = { 'filename' },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'location' },
    },
    tabline = {},
    extensions = {},
}
