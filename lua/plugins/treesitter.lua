return   {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        branch = "main",
        opts = {
            ensure_installed = { "python", "lua", "vim" },
            highlight = { enable = true },
        },
    },
}
