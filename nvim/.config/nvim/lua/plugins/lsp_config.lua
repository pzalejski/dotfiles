vim.pack.add({
    { src = 'https://github.com/neovim/nvim-lspconfig', version = 'master' }
})


-- local lspconfig = require('lspconfig')
local util = require('lspconfig.util')
--

-- LUA
vim.lsp.config("lua_ls",{
    root_dir = util.root_pattern('.git'),
    settings = {
        Lua = {
            format = {
                enable = true,
                defaultConfig = {
                    quote_style = 'single',
                    indent_style = 'space',
                    indent_size = '4',      -- must be a string
                    max_line_length = '120' -- must be a string
                }
            },
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

-- PYTHON
vim.lsp.config("basedpyright",{
    settings = {
        basedpyright = {
            analysis = {
                typeCheckingMode = 'standard',
                diagnosticMode = 'workspace',
                autoSearchPaths = true,
                inlayHints = {
                    functionReturnTypes = false,
                    variableTypes = true,
                    callArgumentNames = true,
                    genericTypes = true
                },
            },
            python = {
                pythonPath = '.venv/bin/python'
            },
            venvPath = '.',
            venv = '.venv'
        }
    }
})

vim.lsp.config("ruff",{
    filetypes = 'python'
})

vim.lsp.enable('ruff')

-- GO
vim.lsp.config("gopls", {
    settings = {
        gopls = {
            ['ui.inlayhint.hints'] = {
                compositeLiteralFields = true,
                constantValues = true,
                parameterNames = true
            },
            analyses = {
                unusedparams = true
            },
            staticcheck = true,
            gofumpt = true
        }
    }
})

-- General and Keymaps
vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP Actions',
    callback = function(event)
        local opts = { buffer = event.buf }

        -- autoformat on save
        vim.api.nvim_create_autocmd('BufWritePre', {
            buffer = opts.buffer,
            callback = function()
                vim.lsp.buf.format({
                    async = false,
                    filter = function(client)
                        return client.supports_method('textDocument/formatting')
                    end,
                })
            end
        })

        -- Enable Inlay hints for all language servers
        vim.defer_fn(function()
            vim.lsp.inlay_hint.enable(true)
        end, 1000)

        local set = vim.keymap.set

        set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
        set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
        set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
        set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
        set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
        set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
        set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
        set('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
        -- set({ 'n', 'x' }, '<leader>S', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
        set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
        set('n', '<leader>ih', '<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<cr>',
            opts)
    end
})
