local M = {}

-- Patterns to match different checkbox states at the beginning of a line
local empty = "^%- %[ %] "   -- - [ ]
local checked = "^%- %[x%] " -- - [x]
local todo = "^%- %[%-%] "   -- - [-]

-- Cycle through states: [ ] -> [x] -> [-] -> removed
function M.set_checkbox()
    -- Get the current cursor position
    local cursor_pos = vim.api.nvim_win_get_cursor(0)
    local row, col = cursor_pos[1], cursor_pos[2]

    -- Split the line into indentation and rest of text
    local line = vim.api.nvim_get_current_line()
    local indent, text = line:match("^([%s]*)(.*)$")

    if text:match(empty) then
        local new_line = text:gsub(empty, "- [x] ", 1)
        vim.api.nvim_set_current_line(indent .. new_line)
    elseif text:match(checked) then
        local new_line = text:gsub(checked, "- [-] ", 1)
        vim.api.nvim_set_current_line(indent .. new_line)
    elseif text:match(todo) then
        local new_line = text:gsub(todo, "", 1)
        vim.api.nvim_set_current_line(indent .. new_line)
        -- `- [ ] ` or any of the filled options are 6 characters
        -- move cursor back 6 places
        vim.api.nvim_win_set_cursor(0, { row, col - 6 })
    else
        -- If no checkbox found, create one att current indent
        local new_line = "- [ ] " .. text
        vim.api.nvim_set_current_line(indent .. new_line)
        -- `- [ ] ` or any of the filled options are 6 characters
        -- move cursor to the right of the inserted/updated checkbox
        vim.api.nvim_win_set_cursor(0, { row, col + 6 })
    end
end

-- Delay kemap setup to make sure bufffer finished initializing
vim.schedule(function()
    if vim.bo.filetype == "markdown" then
        vim.keymap.set({ "n", "i" }, "<leader>x", M.set_checkbox,
            { desc = "Cycle Checkbox State", buffer = true })
    end
end)

return M
