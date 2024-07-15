vim.keymap.set('n', '<leader>Lf', function()
  if vim.bo.filetype == 'python' then
    vim.cmd 'w'
    vim.cmd 'silent !~/.local/share/python/.venv/bin/python -m black %'
    vim.cmd 'silent !~/.local/share/python/.venv/bin/python -m isort %'
  end
end)
vim.keymap.set('n', '<leader>La', require('lspimport').import, { desc = 'LSP: Python auto-import', noremap = true })
vim.keymap.set('n', '<leader>Lv', function()
  vim.cmd('PyrightSetPythonPath ' .. vim.fn.getcwd() .. '/.venv/bin/python')
end, { desc = 'LSP: Python auto-import', noremap = true })
