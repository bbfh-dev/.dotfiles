---[[ Setup lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath
    })
end
vim.opt.rtp:prepend(lazypath)
-- ]]

require("bbfh.plugins")
require("bbfh.options")
require("bbfh.remap")

vim.cmd.colorscheme("github_dark_default")

--- [[ Automatically set the working directory
local group_cdpwd = vim.api.nvim_create_augroup("group_cdpwd", { clear = true })
vim.api.nvim_create_autocmd("VimEnter", {
    group = group_cdpwd,
    pattern = "*",
    callback = function()
        print(vim.fn.expand("%:p:h"))
        vim.api.nvim_set_current_dir(vim.fn.expand("%:p:h"))
    end,
})
-- ]]
