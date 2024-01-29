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

vim.filetype.add({
    extension = {
        mcmeta = "mcmeta",
        mcfunction = "mcfunction",
    },
    filename = {
        ["pack.mcmeta"] = "mcmeta",
    },
    pattern = {
        ["[%w_.-]+.mcmeta"] = "mcmeta",
    },
})
