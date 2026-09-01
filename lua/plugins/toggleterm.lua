return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      direction = "horizontal", -- Opens the terminal at the bottom
      size = 15,                -- Height of the terminal window
    })

    vim.api.nvim_set_keymap("n", "<C-,>", ":ToggleTerm<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("t", "<C-,>", "<C-\\><C-n>:ToggleTerm<CR>", { noremap = true, silent = true })
  end,
}
