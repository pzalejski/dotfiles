vim.g.mapleader = ' '

-- Basic Settings
vim.opt.number = true                          -- Line numbers
vim.opt.relativenumber = true                  -- Relative line numbers
vim.opt.cursorline = true                      -- Highlight current line
vim.opt.scrolloff = 10                         -- Keep 10 lines above/below cursor
vim.opt.sidescrolloff = 8                      -- Keep 8 columns left/right of cusor
vim.opt.wrap = false                           -- Disable linewrap
vim.opt.winborder = 'rounded'                  -- Rounded border style of floating windows
vim.diagnostic.config({ virtual_text = true }) -- virtual text enabled
vim.opt.spell = true                           -- Enable spellchecker
vim.opt.smoothscroll = true                    -- smother scrolling

-- Indentation
vim.opt.tabstop = 4         -- Taps spaces
vim.opt.shiftwidth = 4      -- Indent width
vim.opt.expandtab = true    -- Use spaces instead of tabs
vim.opt.smartindent = false -- Smart auto-indenting
vim.opt.autoindent = false  -- Copy indent from current line

-- Search settings
vim.opt.ignorecase = true -- Case insensitive search
vim.opt.smartcase = true  -- Case sensitive if uppercase in search
vim.opt.hlsearch = false  -- Don't highlight search results
vim.opt.incsearch = true  -- Show matches as you type

-- Visual settings
vim.opt.termguicolors = true                      -- Enable 24-bit colors
vim.opt.signcolumn = 'yes'                        -- Always show sign column
vim.opt.showmatch = true                          -- Highlight matching brackets
vim.opt.completeopt = 'menuone,noinsert,noselect' -- Completion optons

-- File handling
vim.opt.backup = false    -- Don't create backup files
vim.opt.swapfile = false  -- Disable swapfile
vim.opt.undofile = true   -- Persistent undo
vim.opt.updatetime = 50   -- Faster completion
vim.opt.autoread = true   -- Auto reload files changed outside vim
vim.opt.autowrite = false -- Don't autosave

-- Behavior settings
vim.opt.backspace = 'indent,eol,start'  -- Better backspace behavior
vim.opt.clipboard:append('unnamedplus') -- Use system clipboard
vim.opt.virtualedit = 'block'           -- Allow virtual editing in visual block mode
vim.opt.path:append('**')               -- Include subdirectories in search

-- Netrw
vim.g.netrw_banner = 0    -- Disable the banner
vim.g.netrw_liststyle = 3 -- Tree style Explorer

-- Command-line completion
vim.opt.wildmenu = true

-- Folding
vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.opt.foldmethod = 'expr'
vim.opt.foldenable = true
vim.opt.foldlevel = 99
