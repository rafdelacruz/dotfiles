return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",

    dependencies = {
        "neovim-treesitter/treesitter-parser-registry",
    },

    config = function()
        require("nvim-treesitter").setup({})

        require("nvim-treesitter").install({
            "lua",
            "python",
            "c",
            "cpp",
            "java",
        })
    end,
}
