require("toggleterm").setup({
    size = 50,
    open_mapping = [[<c-\>]],
    shade_filetypes = {},
    shading_factor = 2,
    hide_numbers = true,
    shade_terminals = true,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    close_on_exit = true,
    shell = vim.o.shell,
    direction = "vertical",
})
