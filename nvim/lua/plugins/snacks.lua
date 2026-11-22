return {
    "folke/snacks.nvim",

    priority = 1000,
    lazy = false,

    opts = {
        -- File explorer
        explorer = {
            enabled = true,
        },

        -- Fuzzy finder
        picker = {
            enabled = true,
            sources = {
                explorer = {
                    hidden = true,  -- Always show dotfiles
                    ignored = true, -- Show gitignored files
                },
            },
        },

        -- Startup dashboard
        dashboard = {
            enabled = true,
        },

        -- Notifications
        notifier = {
            enabled = true,
        },

        -- Indentation guides
        indent = {
            enabled = true,
        },

        -- Floating terminal
        terminal = {
            enabled = true,
        },

        -- Better input dialogs
        input = {
            enabled = true,
        },

        -- LazyGit
        lazygit = {
            enabled = true,
        },
    },
}
