-- Move lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Center cursor when jumping pages
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Center cursor when searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- System clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set({ "n", "v" }, "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
vim.keymap.set({ "n", "v" }, "<leader>P", [["+P]])
vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]])

-- Remove Q
vim.keymap.set("n", "Q", "<nop>")

-- Tmux
vim.keymap.set("n", "<C-g>", function()
    vim.cmd("silent !tmux neww ~/.local/bin/tmux-sessionizer.sh")
end)

-- Quickfix list
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Replace word
vim.keymap.set("n", "<leader>ls",
    [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

--[[

  PLUGINS:

--]]

-- Color picker
vim.keymap.set("n", "<leader>lcp", function() vim.cmd.Colortils("picker") end)

-- Git status
vim.keymap.set("n", "gs", vim.cmd.Git)

-- Harpoon
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
vim.keymap.set("n", "<leader>hh", mark.add_file)
vim.keymap.set("n", "<leader>hm", ui.toggle_quick_menu)
vim.keymap.set("n", "g1", function() ui.nav_file(1) end)
vim.keymap.set("n", "g2", function() ui.nav_file(2) end)
vim.keymap.set("n", "g3", function() ui.nav_file(3) end)
vim.keymap.set("n", "g4", function() ui.nav_file(4) end)

-- LSP
vim.keymap.set("n", "<leader>lf", vim.cmd.LspZeroFormat)
vim.keymap.set("n", "<leader>lp", function()
    vim.cmd(
        "silent !prettier % --tab-width 4 --jsx-single-quote=false --single-quote=false --write")
end)
vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end)
vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end)
vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end)
vim.keymap.set("n", "<leader>ld", function() vim.diagnostic.open_float() end)
vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end)
vim.keymap.set("n", "<leader>cr", function() vim.lsp.buf.rename() end)
vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end)
vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end)
vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end)

-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.git_files, {})
vim.keymap.set("n", "<leader>fs", function()
    builtin.grep_string({ search = vim.fn.input("Grep → ") })
end)

-- Undotree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
