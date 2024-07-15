-- File management
vim.keymap.set('n', '<leader>w', vim.cmd.w)
vim.keymap.set('n', '<leader>W', '<cmd>noautocmd w<CR>')
vim.keymap.set('n', '<leader>q', function()
  vim.cmd 'q'
end)
vim.keymap.set('n', '<leader>Q', function()
  vim.cmd 'qa'
end)

-- Line wrap
vim.keymap.set({ 'n' }, '<leader>[', function()
  vim.opt.wrap = false
end)
vim.keymap.set({ 'n' }, '<leader>]', function()
  vim.opt.wrap = true
end)

-- System clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]])
vim.keymap.set({ 'n', 'v' }, '<leader>Y', [["+Y]])
vim.keymap.set({ 'n', 'v' }, '<leader>P', [["+P]])
vim.keymap.set({ 'n', 'v' }, '<leader>p', [["+p]])
vim.keymap.set({ 'n' }, '<C-p>', [[o<ESC>"+p]])

-- Move lines
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Find & Replace across project
vim.keymap.set('n', '<leader>sS', function()
  local pattern = vim.fn.input 'Enter filename pattern: '
  local from = vim.fn.input 'Input string to replace: '
  local to = vim.fn.input 'Input the substitution: '
  vim.cmd('gr ' .. from .. ' ' .. pattern)
  vim.cmd('cdo s/' .. from .. '/' .. to .. '/gc')
  vim.cmd 'cfdo up'
end)

-- Split
vim.keymap.set('n', '<leader>=', vim.cmd.vsplit)
vim.keymap.set('n', '<leader>+', vim.cmd.split)

-- Neotree
vim.keymap.set('n', '<C-e>', '<cmd>Neotree action=focus position=current<CR>', { desc = 'Open Neotree' })

-- Harpoon
local harpoon = require 'harpoon'

vim.keymap.set('n', '<leader>ha', function()
  harpoon:list():add()
end)
vim.keymap.set('n', '<leader>hh', function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end)

vim.keymap.set('n', 'g1', function()
  harpoon:list():select(1)
end)
vim.keymap.set('n', 'g2', function()
  harpoon:list():select(2)
end)
vim.keymap.set('n', 'g3', function()
  harpoon:list():select(3)
end)
vim.keymap.set('n', 'g4', function()
  harpoon:list():select(4)
end)

-- Git
vim.keymap.set('n', '<leader>gg', '<cmd>Git<CR>:tabnew %<CR>')
vim.keymap.set('n', '<leader>gc', '<cmd>Git commit<CR>')
vim.keymap.set('n', '<leader>gp', '<cmd>Git push<CR>')
vim.keymap.set('n', '<leader>gq', ':q<CR>:q<CR>')
vim.keymap.set('n', '<leader>Gc', '<cmd>Telescope git_commits<CR>')
vim.keymap.set('n', '<leader>Gb', '<cmd>Telescope git_branches<CR>')
vim.keymap.set('n', '<leader>Gg', '<cmd>Telescope git_status<CR>')

-- Git worktrees
vim.keymap.set('n', '<leader><C-g>a', function()
  local branch = vim.fn.input '(Create) Branch name → '
  require('git-worktree').create_worktree(branch, branch, 'origin')
end)
vim.keymap.set('n', '<leader><C-g>g', function()
  local branch = vim.fn.input '(Switch) Branch name → '
  require('git-worktree').switch_worktree(branch)
end)
vim.keymap.set('n', '<leader><C-g>d', function()
  local branch = vim.fn.input '(Delete) Branch name → '
  require('git-worktree').delete_worktree(branch)
end)

-- Aerial
vim.keymap.set('n', '<leader>sa', '<cmd>AerialToggle!<CR>')
vim.keymap.set('n', ']a', '<cmd>AerialNext<CR>')
vim.keymap.set('n', '[a', '<cmd>AerialPrev<CR>')

-- Swap nodes (arguments of functions, etc)
vim.keymap.set('n', '<leader>mm', vim.cmd.IMoveNodeWith)
vim.keymap.set('n', '<leader>ml', vim.cmd.IMoveWithRight)
vim.keymap.set('n', '<leader>mh', vim.cmd.IMoveWithLeft)

-- LSP Additions
vim.keymap.set('n', '<leader>li', vim.cmd.LspInfo, { desc = 'LSP: Info' })
vim.keymap.set('n', '<leader>lr', vim.cmd.LspRestart, { desc = 'LSP: Restart' })

-- TreeSJ
vim.keymap.set('n', '<leader>cf', function()
  require('treesj').toggle()
end, { desc = 'Toggle code fold' })

-- Bookmarks
vim.keymap.set('n', '<C-s>', '<cmd>Telescope bookmarks<CR>')

-- Neoclip
vim.keymap.set('n', '<C-y>', '<cmd>Telescope neoclip<CR>')

-- Color picker
vim.keymap.set('n', '<leader>cp', vim.cmd.VCoolor)

-- Inlay hints
vim.keymap.set('n', '<leader>ch', vim.cmd.InlayHintsToggle)

return {}
