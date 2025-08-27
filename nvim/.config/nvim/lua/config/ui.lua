-- Set both the Normal window and floating window background colors to transparent / none
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
vim.api.nvim_set_hl(0, "TelescopeInsert", { bg = "none" })
vim.api.nvim_set_hl(0, "cursorline", { bg = '#2a282f' })

-- Non-Focused
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
