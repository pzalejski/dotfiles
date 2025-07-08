-- Custom color
vim.api.nvim_set_hl(0, "YankHighlight", {bg = "#eb6f92"})

vim.api.nvim_create_autocmd("TextYankPost", {
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({ higroup = "YankHighlight", timeout = 150})
    end,
})
