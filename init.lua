local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- Latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Leader key must be set before lazy.setup(), since plugin config()
-- functions run during setup() and <leader> in a keymap resolves at
-- the moment the mapping is created, not later.
vim.g.mapleader = " "

-- coc.nvim extensions to auto-install/update on any machine this config runs on
vim.g.coc_global_extensions = {
  "coc-json",
  "coc-tsserver",
  "coc-pyright",
  "coc-rust-analyzer",
  "coc-clangd",
  "coc-sumneko-lua",
  "coc-go",
  "coc-java",
  "coc-metals",
}

require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
})

-- === Basic Editor Settings ===
vim.o.number = true               -- Show line numbers
vim.o.relativenumber = true       -- Relative line numbers
vim.o.tabstop = 2                 -- Tab width = 2 spaces
vim.o.shiftwidth = 2              -- Indent width = 2 spaces
vim.o.expandtab = true            -- Use spaces instead of tabs
vim.o.termguicolors = true        -- Enable true colors
vim.opt.clipboard = "unnamedplus"
vim.o.mouse = "a"

-- === Keybindings ===

-- Reload Config
vim.api.nvim_set_keymap("n", "<leader>r", ":source $MYVIMRC<CR>", { noremap = true, silent = true })

-- Window management
vim.keymap.set("n", "sv", ":vsplit<CR>", { noremap = true, silent = true, desc = "Vertical Split" })
vim.keymap.set("n", "sh", ":split<CR>", { noremap = true, silent = true, desc = "Horizontal Split" })
vim.keymap.set("n", "q", ":q<CR>", { noremap = true, silent = true, desc = "Close Window" })
