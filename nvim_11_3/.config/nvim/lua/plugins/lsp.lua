local set = vim.keymap.set

return {
    {
        'mason-org/mason.nvim',
        pin = true,
        lazy = false,
        opts = {},
    },
    {
        'mason-org/mason-lspconfig.nvim',
        pin = true,
        lazy = true,
        config = false,
    },
    -- LSP
    {
        'neovim/nvim-lspconfig',
        pin = true,
        cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            { 'saghen/blink.cmp' },
            { 'mason-org/mason.nvim' },
            { 'mason-org/mason-lspconfig.nvim' },
        },

        init = function()
            -- Reserve a space in the gutter
            -- This will avoid an annoying layout shift in the screen
            vim.opt.signcolumn = 'yes'
        end,

        config = function()
            -- LspAttach is where you enable features that only work
            -- if there is a language server active in the file
            vim.api.nvim_create_autocmd('LspAttach', {
                desc = 'LSP actions',
                callback = function(event)
                    local opts = { buffer = event.buf }
                    -- Enable inlay hints for all language servers
                    vim.defer_fn(function()
                        vim.lsp.inlay_hint.enable(true)
                    end, 1000) -- some like rust_analyzer need a delay on first buffer

                    -- autoformat on save
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        buffer = opts.buffer,
                        callback = function()
                            vim.lsp.buf.format { async = false, id = event.data.client_id }
                        end
                    })


                    set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
                    set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
                    set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
                    set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
                    set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
                    set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
                    set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
                    set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
                    set({ 'n', 'x' }, '<leader>fm', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
                    set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
                    set('n', '<leader>ih', '<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<cr>',
                        opts)
                end,
            })

            require('mason-lspconfig').setup({
                ensure_installed = { 'lua_ls', 'basedpyright', 'ruff', 'rust_analyzer' },
                handlers = {
                    -- this first function is the "default handler"
                    -- it applies to every language server without a "custom handler"
                    function(server_name)
                        require('lspconfig')[server_name].setup({
                        })
                    end,

                    basedpyright = function()
                        require('lspconfig').basedpyright.setup({
                            settings = {
                                basedpyright = {
                                    analysis = {
                                        typeCheckingMode = "standard",
                                        diagnosticMode = "workspace",
                                        inlayHints = {
                                            functionReturnTypes = false,
                                            variableTypes = true,
                                            callArgumentNames = true,
                                            genericTypes = true
                                        }
                                    }
                                }
                            }
                        })
                    end,

                    lua_ls = function()
                        require('lspconfig').lua_ls.setup({
                            settings = {
                                Lua = {
                                    diagnostics = {
                                        globals = { 'vim' }
                                    }
                                }
                            }
                        })
                    end,

                    rust_analyzer = function()
                        require('lspconfig').rust_analyzer.setup({
                            settings = {
                                ['rust-analyzer'] = {
                                    check = {
                                        command = "clippy"
                                    },
                                    diagnostics = {
                                        enable = true
                                    },
                                }
                            }
                        })
                    end
                }
            })
        end
    }
}
