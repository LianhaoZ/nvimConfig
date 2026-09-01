return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("nvim-tree").setup({ view = { width = 30 } })
    -- Open NvimTree automatically when Neovim starts
    vim.cmd("autocmd VimEnter * NvimTreeOpen")
    vim.api.nvim_set_keymap("n", "<C-p>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
  end,
}
