-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- File: ~/.config/nvim/lua/config/autocmds.lua

-- Create an AutoGroup to manage the transparency commands
local transparent_augroup = vim.api.nvim_create_augroup("TransparentBackground", { clear = true })

-- Create an autocommand that runs AFTER any colorscheme is loaded
vim.api.nvim_create_autocmd("ColorScheme", {
  group = transparent_augroup,
  pattern = "*", -- Run for any colorscheme
  callback = function()
    -- Set the main background to transparent
    vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" }) -- Normal for non-current windows
    vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "NONE" })

    vim.api.nvim_set_hl(0, "Dashboard", { bg = "NONE" })

    -- Optional: Make other common UI elements transparent (highly recommended)
    vim.api.nvim_set_hl(0, "NonText", { bg = "NONE" }) -- Area outside text
    vim.api.nvim_set_hl(0, "LineNr", { bg = "NONE" }) -- Line numbers
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" }) -- Git signs/folds column
    vim.api.nvim_set_hl(0, "FoldColumn", { bg = "NONE" }) -- Fold column

    -- Optional: Make the CursorLine background transparent
    -- LazyVim/themes often set the CursorLine background. This removes it.
    vim.api.nvim_set_hl(0, "CursorLine", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "NONE" }) -- Cursor line number
  end,
})
