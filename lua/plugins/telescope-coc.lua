return {
  "fannheyward/telescope-coc.nvim",
  dependencies = { "nvim-telescope/telescope.nvim", "neoclide/coc.nvim" },
  config = function()
    require("telescope").load_extension("coc")

    -- Peek definition/references/etc. in a picker with a live preview pane.
    -- <CR> or a mouse click on a result jumps to that file/location.
    vim.keymap.set("n", "<leader>pd", ":Telescope coc definitions<CR>", { silent = true, desc = "Peek Definition" })
    vim.keymap.set("n", "<leader>py", ":Telescope coc type_definitions<CR>", { silent = true, desc = "Peek Type Definition" })
    vim.keymap.set("n", "<leader>pi", ":Telescope coc implementations<CR>", { silent = true, desc = "Peek Implementation" })
    vim.keymap.set("n", "<leader>pr", ":Telescope coc references<CR>", { silent = true, desc = "Peek References" })
  end,
}
