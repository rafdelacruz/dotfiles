local opt = vim.opt

-- Global Leader Key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Line Numbers
opt.number = true           -- Show absolute line number
opt.relativenumber = true -- Show relative numbered lines

-- Tabs and Indentation
opt.tabstop = 4             -- Number of spaces a tab counts for
opt.softtabstop = 4         -- Number of spaces a tab counts for while editing
opt.shiftwidth = 4          -- Size of an indent
opt.expandtab = true        -- Use spaces instead of tabs
opt.smartindent = true      -- Insert indents automatically

-- Search Behaviour
opt.ignorecase = true       -- Ignore case in search patterns
opt.smartcase = true        -- Override ignorecase if search contains capitals
opt.hlsearch = true         -- Clear search highlights after matching (or use true)
opt.incsearch = true        -- Show search matches while typing

-- Splitting Windows
opt.splitbelow = true       -- Horizontal splits open below
opt.splitright = true       -- Vertical splits open to the right
opt.eadirection = "both"

-- UI and Performance
opt.termguicolors = true    -- True color support
opt.cursorline = true       -- Highlight the text line of the cursor
opt.signcolumn = "yes"      -- Always show the sign column to prevent text shifting
opt.scrolloff = 8           -- Minimum number of screen lines to keep above/below the cursor
opt.sidescrolloff = 8       -- Minimum number of screen columns to keep left/right
opt.showtabline = 1         -- Show tabline when there are at least two tabs
opt.hidden = true
opt.switchbuf = "usetab,newtab"

-- Undo & Backup Files
opt.undofile = true         -- Save undo history to a file
opt.swapfile = false        -- Disable swap file creation
opt.backup = false          -- Disable backup file creation

-- Sessions
opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
