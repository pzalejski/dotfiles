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

    -- Autocompletion
    {
        'saghen/blink.cmp',
        -- optional: provides snippets for the snippet source
        dependencies = { 'rafamadriz/friendly-snippets' },

        -- use a release tag to download pre-built binaries
        version = '1.*',
        -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
        -- build = 'cargo build --release',
        -- If you use nix, you can build from source using latest nightly rust with: build = 'nix run .#build-plugin',

        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
            -- 'super-tab' for mappings similar to vscode (tab to accept)
            -- 'enter' for enter to accept
            -- 'none' for no mappings
            --
            -- All presets have the following mappings:
            -- C-space: Open menu or open docs if already open
            -- C-n/C-p or Up/Down: Select next/previous item
            -- C-e: Hide menu
            -- C-k: Toggle signature help (if signature.enabled = true)
            --
            -- See :h blink-cmp-config-keymap for defining your own keymap
            keymap = { preset = 'default' },

            appearance = {
                -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
                -- Adjusts spacing to ensure icons are aligned
                nerd_font_variant = 'mono'
            },

            -- (Default) Only show the documentation popup when manually triggered
            completion = { documentation = { auto_show = false } },

            -- Default list of enabled providers defined so that you can extend it
            -- elsewhere in your config, without redefining it, due to `opts_extend`
            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' },
            },

            -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
            -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
            -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
            --
            -- See the fuzzy documentation for more information
            fuzzy = { implementation = "prefer_rust_with_warning" }
        },
        opts_extend = { "sources.default" }
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

                    set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
                    set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
                    set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
                    set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
                    set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
                    set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
                    set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
                    set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
                    set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
                    set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
                    set('n', '<leader>ih', '<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<cr>', opts)
                end,
            })

            require('mason-lspconfig').setup({
                ensure_installed = { 'lua_ls', 'basedpyright', 'ruff', 'gh-actions-language-server' },
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
