return {
    "tpope/vim-fugitive",
    lazy = true,
    version = false,
    config = function()

vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
    end,
}
