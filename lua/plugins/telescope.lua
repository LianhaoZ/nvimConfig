return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("telescope").setup({})

    -- Keybindings for Telescope
    vim.api.nvim_set_keymap("n", "fg", ":Telescope find_files<CR>", { noremap = true, silent = true }) -- Find files
    vim.api.nvim_set_keymap("n", "f", ":Telescope live_grep<CR>", { noremap = true, silent = true })   -- Live grep
    vim.api.nvim_set_keymap("n", "<leader>fb", ":Telescope buffers<CR>", { noremap = true, silent = true })   -- Open buffers
    vim.api.nvim_set_keymap("n", "<leader>fh", ":Telescope help_tags<CR>", { noremap = true, silent = true }) -- Help tags
  end,
}
