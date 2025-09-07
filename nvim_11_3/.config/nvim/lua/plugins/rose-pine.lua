local default = {
    _nc = "#16141f",
    base = "#191724",
    surface = "#1f1d2e",
    overlay = "#26233a",
    muted = "#6e6a86",
    subtle = "#908caa",
    text = "#e0def4",
    love = "#eb6f92",
    gold = "#f6c177",
    rose = "#ebbcba",
    pine = "#31748f",
    foam = "#9ccfd8",
    iris = "#c4a7e7",
    leaf = "#95b1ac",
    highlight_low = "#21202e",
    highlight_med = "#403d52",
    highlight_high = "#524f67",
    none = "NONE",
}

local gray_rose_iris = {
    _nc = "#1a181f",            -- dark gray-black
    base = "#222127",           -- dark graphite gray
    surface = "#2c2a34",        -- soft charcoal
    overlay = "#38373f",        -- medium dark gray overlay
    muted = "#707075",          -- neutral gray with blue undertone
    subtle = "#8d8f99",         -- soft blue-gray
    text = "#e0def4",
    love = "#ef6f9f",           -- vibrant orange-red (accent)
    gold = "#f6c177",
    rose = "#ebbcba",           -- muted peachy-orange (accent)
    pine = "#3c8599",           -- fresh pine blue-green
    foam = "#87b2b7",           -- misty aqua
    iris = "#c4a7e7",
    leaf = "#5f8d7a",           -- soft teal-green
    highlight_low = "#282528",  -- low contrast gray overlay
    highlight_med = "#484441",  -- mid-tone overlay
    highlight_high = "#5e5954", -- brighter highlight gray
    none = "NONE",
}


local noir = {
    _nc            = "#16141f",
    base           = "#1b1a1e",
    surface        = "#111015",
    overlay_dark   = "#2a282f",
    muted          = "#6e6a73",
    subtle         = "#a19ca9",
    text           = "#e0def4",
    love           = "#d17a87",
    gold           = "#f6c177",
    rose           = "#d4a8a6",
    pine           = "#45687b",
    foam           = "#88b9c0",
    iris           = "#b59dd4",
    leaf           = "#9fafa0",
    highlight_low  = "#21202e",
    highlight_med  = "#403d52",
    highlight_high = "#524f67",
    none           = "NONE",
}


return {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
        require("rose-pine").setup({
            enable = {
                terminal = true
            },
            dim_inactive_windows = true,
            extend_background_behind_borders = true,
            styles = {
                bold = true,
                italic = true,
                transparency = true -- keep enabled so popup windows dont have whack borders
            },
            palette = {
                -- main = noir
                main = default
            }
        })
        vim.cmd("colorscheme rose-pine")
    end
}
