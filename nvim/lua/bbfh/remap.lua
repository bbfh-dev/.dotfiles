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
vim.keymap.set({ "n", "v" }, "<leader>P", [["+P]])
vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]])
vim.keymap.set({ "n" }, "<C-p>", [[o<ESC>"+p]])

-- Remove Q
vim.keymap.set("n", "Q", "<nop>")

-- Tmux
vim.keymap.set("n", "<C-g>", function() vim.cmd("!nohup sh ~/.local/bin/tmux-sessionizer.sh $PPID &") end)

-- Quickfix list
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Replace word
vim.keymap.set("n", "<leader>ls",
    [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>r", [["_diw]])

-- Put maximized window back
vim.keymap.set("n", "<C-w>t", "mAZZ<C-w>S`A<CR>")

-- Change directory into PWD
vim.keymap.set("n", "<leader>cd", "<cmd>cd $PWD<CR>")

-- File management
vim.keymap.set("n", "<leader>w", vim.cmd.w)
vim.keymap.set("n", "<leader>q", function() vim.cmd("q") end)
vim.keymap.set("n", "<leader>Q", function() vim.cmd("qa") end)
vim.keymap.set("n", "<C-w>D", "<cmd>windo diffthis<CR>")

-- Split
vim.keymap.set("n", "<leader>=", vim.cmd.vsplit)
vim.keymap.set("n", "<leader>+", vim.cmd.split)

--[[

  PLUGINS:

--]]

-- Color picker
vim.keymap.set("n", "<leader>lcp", function() vim.cmd.Colortils("picker") end)

-- Git
vim.keymap.set("n", "<leader>gg", "<cmd>Git<CR>:resize 100%<CR>")
vim.keymap.set("n", "<leader>gc", "<cmd>Git commit<CR>")
vim.keymap.set("n", "<leader>gp", "<cmd>Git push<CR>")
vim.keymap.set("n", "<leader>fgc", "<cmd>Telescope git_commits<CR>")
vim.keymap.set("n", "<leader>fgb", "<cmd>Telescope git_branches<CR>")
vim.keymap.set("n", "<leader>fgg", "<cmd>Telescope git_status<CR>")

-- Git signs
vim.keymap.set("n", "<leader>gs", "<cmd>Gitsigns toggle_signs<CR>")
vim.keymap.set("n", "<leader>gh", "<cmd>Gitsigns preview_hunk<CR>")
vim.keymap.set("n", "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<CR>")

-- Harpoon
local harpoon = require("harpoon")
vim.keymap.set("n", "<leader>ha", function() harpoon:list():append() end)
vim.keymap.set("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
vim.keymap.set("n", "g1", function() harpoon:list():select(1) end)
vim.keymap.set("n", "g2", function() harpoon:list():select(2) end)
vim.keymap.set("n", "g3", function() harpoon:list():select(3) end)
vim.keymap.set("n", "g4", function() harpoon:list():select(4) end)

-- LSP
vim.keymap.set("n", "<leader>lf", vim.cmd.LspZeroFormat)
vim.keymap.set("n", "<leader>li", vim.cmd.LspInfo)
vim.keymap.set("n", "<leader>lr", vim.cmd.LspRestart)
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

-- Neotree
vim.keymap.set("n", "<leader>fr", function() vim.cmd.Neotree("toggle") end)

-- Commenting
vim.keymap.set("n", "<leader>cc", vim.cmd.CommentToggle)
vim.keymap.set("v", "<leader>cc", ":'<,'>CommentToggle<CR>")

-- TreeSJ
vim.keymap.set("n", "<leader>cf", function() require('treesj').toggle() end)

-- Aerial
vim.keymap.set("n", "<leader>fa", "<cmd>AerialToggle!<CR>")

-- Debugger
vim.keymap.set("n", "<leader>dd", vim.cmd.DapToggleBreakpoint)
vim.keymap.set("n", "<leader>dc", vim.cmd.DapContinue)
vim.keymap.set("n", "<leader>dq", vim.cmd.DapTerminate)
vim.keymap.set("n", "]s", vim.cmd.DapStepOver)
vim.keymap.set("n", "]S", vim.cmd.DapStepInto)

-- Swapper
vim.keymap.set("n", "<leader>S", vim.cmd.ISwapWith)
