return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = false,
    branc = "main",
    opts = {
      ensure_installed = {
        "c", "lua", "vim", "vimdoc", "query", 
        "markdown", "markdown_inline", "python", "rust"
      },
      sync_install = false,
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    },
    config = function(_, opts) -- ignore the first argument, use the second
      require("nvim-treesitter.configs").setup(opts)
    end,
}
