return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = false,
        dependencies = {
            { "nvim-treesitter/nvim-treesitter-textobjects", "HiPhish/rainbow-delimiters.nvim" },
            {
                "nvim-treesitter/nvim-treesitter-context",
                opts = {
                    enable = true,            -- Enable this plugin (Can be enabled/disabled later via commands)
                    multiwindow = false,      -- Enable multiwindow support.
                    max_lines = 0,            -- How many lines the window should span. Values <= 0 mean no limit.
                    min_window_height = 0,    -- Minimum editor window height to enable context. Values <= 0 mean no limit.
                    line_numbers = true,
                    multiline_threshold = 20, -- Maximum number of lines to show for a single context
                    trim_scope = "outer",     -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
                    mode = "cursor",          -- Line used to calculate context. Choices: 'cursor', 'topline'
                    -- Separator between context and content. Should be a single character string, like '-'.
                    -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
                    separator = nil,
                    zindex = 20,     -- The Z-index of the context window
                    on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
                },
                config = function(_, opts)
                    require "treesitter-context".setup(opts)
                end
            },
        },
        opts = {
            ensure_installed = {
                "c", "lua", "vim", "vimdoc", "query",
                "markdown", "markdown_inline", "python", "rust"
            },
            sync_install = false,
            auto_install = true,
            highlight = { enable = true },
            indent = {
                enable = true,
                disable = { "rust" }
            },
            textobjects = {
                select = {
                    enable = true,

                    -- Automatically jump forward to textobj, similar to targets.vim
                    lookahead = true,

                    keymaps = {
                        -- You can use the capture groups defined in textobjects.scm
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["ac"] = "@class.outer",
                        ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
                        -- You can also use captures from other query groups like `locals.scm`
                        ["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
                    },
                    selection_modes = {
                        ["@parameter.outer"] = "v", -- charwise
                        ["@function.outer"] = "v",  -- linewise
                        ["@class.outer"] = "<c-v>", -- blockwise
                    },
                    -- If you set this to `true` (default is `false`) then any textobject is
                    -- extended to include preceding or succeeding whitespace. Succeeding
                    -- whitespace has priority in order to act similarly to eg the built-in
                    -- `ap`.
                    include_surrounding_whitespace = true,
                },
            },
        },
        config = function(_, opts) -- ignore the first argument, use the second
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
}
