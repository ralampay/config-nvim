vim.g.mapleader = ","

local keymap = vim.keymap -- for conciseness

keymap.set("n", "x", '"_x')
keymap.set("n", "<leader>sv", "<C-w>v")           -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s")           -- split window horizontally
keymap.set("n", "<leader>ml", "<C-w>l")           -- move to left window
keymap.set("n", "<leader>mk", "<C-w>k")           -- move to upper tab
keymap.set("n", "<leader>mj", "<C-w>j")           -- move to lower tab
keymap.set("n", "<leader>tn", ":tabn<CR>")        -- go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>")        -- go to previous tab
keymap.set("n", "<C-p>", ":Files<CR>")            -- fzf search
keymap.set("n", "<leader>n", ":NvimTreeToggle<CR>")   -- NvimTreeToggle

keymap.set("v", "<CR>", function()
  -- Properly exit Visual Mode
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", false)
  -- Delay slightly to avoid weird pending behavior
  vim.defer_fn(function()
    vim.cmd("AvanteAsk")
  end, 50)
end, { desc = "Avante: Submit Visual Selection" })
