local null_ls = require("null-ls")
null_ls.setup({
    sources = {
        null_ls.builtins.formatting.isort,
        null_ls.builtins.formatting.gofumpt,
        null_ls.builtins.formatting.golines,
        null_ls.builtins.formatting.biome,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.mdformat,
        null_ls.builtins.formatting.cbfmt,
        null_ls.builtins.formatting.clang_format,
        null_ls.builtins.formatting.prettier.with({
            args = {
                "--tab-width 4",
                "--jsx-single-quote=false",
                "--single-quote=false"
            }
        }),
        null_ls.builtins.formatting.shfmt,
        null_ls.builtins.formatting.stylua.with({
            args = { "--indent_type='Spaces'" }
        }),
        null_ls.builtins.completion.spell
    }
})
