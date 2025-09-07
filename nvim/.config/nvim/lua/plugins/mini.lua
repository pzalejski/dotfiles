local gh = 'https://github.com/echasnovski/'
vim.pack.add({
    { src = gh .. 'mini.pick' },
    { src = gh .. 'mini.fuzzy' },
    { src = gh .. 'mini.ai' },
    { src = gh .. 'mini.surround' },
    { src = gh .. 'mini.pairs' },
    { src = gh .. 'mini.notify' },
    { src = gh .. 'mini.icons' },
    { src = gh .. 'mini.indentscope' },
    { src = gh .. 'mini.starter' }
})


require('mini.pick').setup({})

require('mini.fuzzy').setup()

require('mini.ai').setup()

require('mini.surround').setup()

require('mini.pairs').setup()

require('mini.icons').setup()

require('mini.indentscope').setup()

local Pick = function(name, cmd)
    cmd = 'Pick ' .. cmd
    return { action = cmd, name = name, section = 'Picker' }
end



local starter = require('mini.starter')
starter.setup({
    items = {
        starter.sections.builtin_actions(),
        Pick('Files', 'files'),
        Pick('Help Tags', 'help'),
        Pick('Recent Files', 'recent'),
        starter.sections.recent_files(5, true, false),
    },
    footer = 'pwd: '
        .. vim.fn.fnamemodify(vim.fn.getcwd(), ':~:.'),
    content_hooks = {
        starter.gen_hook.aligning('center', 'center'),
    }
})

require('mini.notify').setup({
    lsp_progress = {
        enable = false
    },
    content = {
        format = function(message)
            local icons = {
                ERROR = '',
                WARN = '',
                INFO = '',
                DEBUG = '',
                TRACE = '',
            }

            local icon = icons[message.level] .. ' │ ' or ''
            local time = vim.fn.strftime('%H:%M:%S ', math.floor(message.ts_update))

            local text = icon .. message.msg
            return time .. text
        end
    },
    window = {
        config = {
            relative = 'editor',
            anchor = 'NE',
            width = 50,
            height = nil,
            style = 'minimal',
            border = 'rounded',
            row = 1,
            col = vim.o.columns - 2,
        },

        winblend = 20,
        zindex = 30,

        top_down = true
    },

    delay = {
        INFO = 3000,
        WARN = 4000,
        ERROR = 5000
    }
})


vim.notify = require('mini.notify').make_notify()
