return {
  "neoclide/coc.nvim",
  branch = "release",
  build = "yarn install --frozen-lockfile --production=false || npm ci",
  config = function()
    -- Keep K as a manual hover trigger too, so it doesn't fall through to
    -- Neovim's default keywordprg (:Man) when no float is open yet.
    vim.keymap.set("n", "K", "<Cmd>call CocActionAsync('doHover')<CR>", { silent = true })

    -- Show hover documentation automatically when the cursor is idle
    vim.o.updatetime = 300
    vim.api.nvim_create_autocmd("CursorHold", {
      pattern = "*",
      callback = function()
        if vim.bo.buftype ~= "" then
          return
        end
        if vim.fn["coc#float#has_float"]() == 0 and vim.fn.CocHasProvider("hover") == 1 then
          vim.fn.CocActionAsync("doHover")
        end
      end,
    })

    -- Go to / references / implementation (coc mappings)
    vim.keymap.set("n", "gd", "<Plug>(coc-definition)", { silent = true })
    vim.keymap.set("n", "gy", "<Plug>(coc-type-definition)", { silent = true })
    vim.keymap.set("n", "gi", "<Plug>(coc-implementation)", { silent = true })
    vim.keymap.set("n", "gr", "<Plug>(coc-references)", { silent = true })

    -- Rename
    vim.keymap.set("n", "<leader>rn", "<Plug>(coc-rename)", { silent = true })

    -- Use <Tab> for coc completion navigation in insert mode (adjust if you prefer another mapping)
    vim.api.nvim_set_keymap("i", "<TAB>", 'pumvisible() ? "\\<C-n>" : "\\<TAB>"', { expr = true, noremap = true })

    -- Use <S-Tab> to go back in completion menu
    vim.api.nvim_set_keymap("i", "<S-TAB>", 'pumvisible() ? "\\<C-p>" : "\\<S-TAB>"', { expr = true, noremap = true })
  end,
}
