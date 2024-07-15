vim.keymap.set('n', '<leader>Lc', vim.cmd.GoCmt, { desc = 'Golang: Add comment', noremap = true })
vim.keymap.set('n', '<leader>Lta', vim.cmd.GoAddTag, { desc = 'Golang: Add struct tag', noremap = true })
vim.keymap.set('n', '<leader>Ltd', vim.cmd.GoRmTag, { desc = 'Golang: Remove struct tag', noremap = true })

vim.keymap.set('n', '<leader>Lim', function()
  local name = vim.fn.input 'Enter <name>: '
  local model = vim.fn.input 'Enter <Model>: '
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col, {
    '',
    string.format('func New%s() %s {', model, model),
    string.format('	return %s{}', model),
    '}',
    '',
    string.format('func (%s %s) Init() tea.Cmd {', name, model),
    '	return nil',
    '}',
    '',
    string.format('func (%s %s) Update(raw tea.Msg) (tea.Model, tea.Cmd) {', name, model),
    string.format('	return %s, nil', name),
    '}',
    '',
    string.format('func (%s %s) View() string {', name, model),
    '	return ""',
    '}',
  })
end)
