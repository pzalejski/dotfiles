-- Set both the Normal window and floating window background colors to transparent / none
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

-- Non-Focused
vim.api.nvim_set_hl(0, "NormalNC", { bg = "#191724" })
