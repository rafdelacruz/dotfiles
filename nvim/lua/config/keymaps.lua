local map = vim.keymap.set

-- Modes
--   normal mode       = "n"
--   insert mode       = "i"
--   visual mode       = "v"
--   visual block mode = "x"
--   terminal mode     = "t"
--   command mode      = "c"

-- Save / Quit
map("n", "<leader>w", "<cmd>w<CR>",  { desc = "Save", silent = true })
map("n", "<leader>q", "<cmd>qa<CR>",  { desc = "Quit", silent = true })
map("n", "<leader>x", "<cmd>wqa<CR>", { desc = "Save and Quit", silent = true })

-- Better Window Navigation
map("n", "<A-h>", "<C-w>h", { desc = "Go to Left Window",  silent = true })
map("n", "<A-j>", "<C-w>j", { desc = "Go to Lower Window", silent = true })
map("n", "<A-k>", "<C-w>k", { desc = "Go to Upper Window", silent = true })
map("n", "<A-l>", "<C-w>l", { desc = "Go to Right Window", silent = true })

-- Window Resizing
-- Directional resizing (moves the border in the direction of the arrow)
map("n", "<A-S-k>", function()
  if vim.fn.winnr() == vim.fn.winnr("j") then vim.cmd("resize +2") else vim.cmd("resize -2") end
end, { desc = "Resize Up" })

map("n", "<A-S-j>", function()
  if vim.fn.winnr() == vim.fn.winnr("j") then vim.cmd("resize -2") else vim.cmd("resize +2") end
end, { desc = "Resize Down" })

map("n", "<A-S-h>", function()
  if vim.fn.winnr() == vim.fn.winnr("l") then vim.cmd("vertical resize +2") else vim.cmd("vertical resize -2") end
end, { desc = "Resize Left" })

map("n", "<A-S-l>", function()
  if vim.fn.winnr() == vim.fn.winnr("l") then vim.cmd("vertical resize -2") else vim.cmd("vertical resize +2") end
end, { desc = "Resize Right" })

-- Window Management
map("n", "<leader>ws", "<cmd>split<CR>", { desc = "Split Window Below", })
map("n", "<leader>wv", "<cmd>vsplit<CR>", { desc = "Split Window Right", })
map("n", "<leader>wc", "<cmd>close<CR>", { desc = "Close Window", })
map("n", "<leader>wo", "<cmd>only<CR>", { desc = "Close Other Windows", })
map("n", "<leader>ww", "<C-w>w", { desc = "Cycle Windows", })
map("n", "<leader>wr", "<C-w>r", { desc = "Rotate Windows", })

-- Buffers
map("n", "<leader>bn", "<cmd>bnext<CR>", { desc = "Next Buffer", })
map("n", "<leader>bp", "<cmd>bprevious<CR>", { desc = "Previous Buffer", })
map("n", "<leader>bd", function() Snacks.bufdelete() end, { desc = "Delete Buffer", })
map("n", "<leader>ba", function() Snacks.bufdelete.all() end, { desc = "Delete All Buffers", })
map("n", "<leader>bo", function() Snacks.bufdelete.other() end, { desc = "Delete All Other Buffers", })
map("n", "<leader>bl", "<cmd>buffers<CR>", { desc = "List Buffers", })

-- Select All in Buffer
map("n", "<C-a>", "ggVG", { desc = "Select all" })

-- Tabs
map("n", "<leader><Tab>n", "<cmd>tabnew<CR>", { desc = "New Tab", })
map("n", "<leader><Tab>c", "<cmd>tabclose<CR>", { desc = "Close Tab", })
map("n", "<leader><Tab>]", "<cmd>tabnext<CR>", { desc = "Next Tab", })
map("n", "<leader><Tab>[", "<cmd>tabprevious<CR>", { desc = "Previous Tab", })
map("n", "<leader><Tab>l", "<cmd>tabs<CR>", { desc = "List Tabs", })

-- Clear Search Highlights
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { silent = true })

-- Visual Mode Indentation
map("v", "<", "<gv", { desc = "Indent Less" })
map("v", ">", ">gv", { desc = "Indent More" })

-- Move Blocks of Text
map("n", "<C-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
map("n", "<C-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
map("i", "<C-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<C-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<C-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
map("v", "<C-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

-- Copy/Paste for WSL Windows System Clipboard
map({ "n", "v" }, "<leader>y", '"+y', { desc = "Copy to Windows Clipboard" })
map({ "n", "v" }, "<leader>p", '"+p', { desc = "Paste from Windows Clipboard" })

-- Keep Cursor Centered when Jumping
map("n", "<C-d>", "<C-d>zz", { silent = true })
map("n", "<C-u>", "<C-u>zz", { silent = true })
map("n", "n", "nzzzv", { silent = true })
map("n", "N", "Nzzzv", {silent = true })

-- Snacks picker
map("n", "<C-p>", function() Snacks.picker.files() end, { desc = "Find Files" })
map("n", "<leader>fg", function() Snacks.picker.grep() end, { desc = "Live Grep" })
map("n", "<leader>fb", function() Snacks.picker.buffers() end, { desc = "Find Buffers" })
map("n", "<leader>e", function() Snacks.explorer() end, { desc = "File Explorer" })
map("n", "<leader>;", function() Snacks.dashboard() end, { desc = "Dashboard" })
map("n", "<leader>t", function() Snacks.terminal() end, { desc = "Toggle Terminal" })

-- Git (Gitsigns)
map("n", "]c", function()
    if vim.wo.diff then
        return "]c"
    end

    vim.schedule(function()
        require("gitsigns").next_hunk()
    end)

    return "<Ignore>"
end, { expr = true, desc = "Next Git Change" })

map("n", "[c", function()
    if vim.wo.diff then
        return "[c"
    end

    vim.schedule(function()
        require("gitsigns").prev_hunk()
    end)

    return "<Ignore>"
end, { expr = true, desc = "Previous Git Change" })

map("n", "<leader>hs", function()
    require("gitsigns").stage_hunk()
end, { desc = "Stage Git Hunk" })

map("n", "<leader>hu", function()
    require("gitsigns").undo_stage_hunk()
end, { desc = "Undo Stage Hunk" })

map("n", "<leader>hr", function()
    require("gitsigns").reset_hunk()
end, { desc = "Reset Git Hunk" })

map("n", "<leader>hp", function()
    require("gitsigns").preview_hunk()
end, { desc = "Preview Git Hunk" })

map("n", "<leader>hb", function()
    require("gitsigns").blame_line()
end, { desc = "Git Blame Line" })

map("n", "<leader>hd", function()
    require("gitsigns").diffthis()
end, { desc = "Git Diff" })

-- Diagnostics
map("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show Line Diagnostics", })
map("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end, { desc = "Previous Diagnostic" })
map("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end, { desc = "Next Diagnostic" })
map("n", "<leader>dl", vim.diagnostic.setloclist, { desc = "Diagnostic Location List", })

-- Formatting
map("n", "<leader>cf", function()
    require("conform").format({
        async = true,
        lsp_format = "never",
    })
end, { desc = "Format Current File" })

-- LazyGit
map("n", "<leader>gg", function()
    Snacks.lazygit()
end, { desc = "Open LazyGit" })
