return   {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = {
            ensure_installed = { "python", "lua", "vim" },
            highlight = { enable = true },
        },
    },
}
