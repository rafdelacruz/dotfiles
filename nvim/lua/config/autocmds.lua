local autocmd = vim.api.nvim_create_autocmd

-- Enable Treesitter syntax highlighting for supported filetypes
autocmd("FileType", {
    pattern = { "lua", "python", "c", "cpp", "java" },
    callback = function()
        vim.treesitter.start()
    end,
})

-- Highlight text briefly after yanking
autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- Remove trailing whitespace before saving
autocmd("BufWritePre", {
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

-- Disable Automatic Comment Insertion on New Lines
vim.api.nvim_create_autocmd("FileType", {
    callback = function()
        vim.opt_local.formatoptions:remove({ "c", "r", "o" })
    end,
})

-- Run linters after saving a file
autocmd("BufWritePost", {
    callback = function()
        require("lint").try_lint()
    end,
})
