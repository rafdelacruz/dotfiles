return {
    {
        "lewis6991/gitsigns.nvim",

        event = { "BufReadPre", "BufNewFile" },

        opts = {
            signs = {
                add = {
                    text = "│",
                },
                change = {
                    text = "│",
                },
                delete = {
                    text = "_",
                },
                topdelete = {
                    text = "‾",
                },
                changedelete = {
                    text = "~",
                },
            },

            -- Enable blame tracking for the status bar
            current_line_blame = true,
            current_line_blame_opts = {
                virt_text = false, -- Hide inline virtual text
                delay = 50,       -- Delay in ms before updating
            },

            -- Optional: customize how the text looks in your status bar
            current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
        },
    },
}
