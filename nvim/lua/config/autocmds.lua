local autocmd = vim.api.nvim_create_autocmd

-- Track closed buffers
_G.closed_buffers = {}

vim.api.nvim_create_autocmd("BufDelete", {
    group = vim.api.nvim_create_augroup("TrackClosedBuffers", { clear = true }),
    callback = function(args)
        local file = vim.api.nvim_buf_get_name(args.buf)
        -- Only save real, readable files (ignores empty buffers or plugin popups)
        if file ~= "" and vim.fn.filereadable(file) == 1 then
            -- Avoid adding duplicates back-to-back
            if _G.closed_buffers[#_G.closed_buffers] ~= file then
                table.insert(_G.closed_buffers, file)
            end
        end
    end,
})

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
