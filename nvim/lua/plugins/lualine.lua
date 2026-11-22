return {
    {
        "nvim-lualine/lualine.nvim",

        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },

        opts = {
            options = {
                theme = "auto",
                globalstatus = true,
                section_separators = "",
                component_separators = "",
            },

            sections = {
                lualine_c = {
                    "filename",
                    function()
                        return vim.b.gitsigns_blame_line or ""
                    end,
                },
            },
        },
    },
}
