return   {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        branch = "main",
        opts = {
            ensure_installed = { "python", "lua", "vim", "hcl" },
            highlight = { enable = true },
        },
    },
}
