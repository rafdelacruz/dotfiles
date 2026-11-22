return {
    {
        "mfussenegger/nvim-lint",

        config = function()
            require("lint").linters_by_ft = {
                python = { "ruff" },

                c = { "clangtidy" },
                cpp = { "clangtidy" },
            }
        end,
    },
}
