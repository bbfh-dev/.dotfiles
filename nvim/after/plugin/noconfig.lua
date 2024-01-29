require("which-key").setup()
require("autoclose").setup({
    keys = {
        ["'"] = { escape = false, close = false, pair = "''" },
    }
})
require("mason").setup()
require("mason-lspconfig").setup()
require("lspconfig").lua_ls.setup({})
require("lspconfig").tsserver.setup({})
require("lspconfig").cssls.setup({})
require("lspconfig").pyright.setup({})
require("lspconfig").jsonls.setup({
    filetypes = { "json", "jsonc", "mcmeta" }
})
require("lspconfig").gopls.setup({})
require("lspconfig").taplo.setup({})
require("lspconfig").clangd.setup({})
require("lspconfig").ltex.setup({})
require("lspconfig").spyglassmc_language_server.setup({})
require("harpoon"):setup({})
require("nvim-ts-autotag").setup()
require("nvim_comment").setup()
require("git-worktree").setup({
    change_directory_command = "cd",  -- default: "cd",
    update_on_change = true,          -- default: true,
    update_on_change_command = "e .", -- default: "e .",
    clearjumps_on_change = true,      -- default: true,
    autopush = false,                 -- default: false,
})
require('color-picker').setup({
    -- ["icons"] = { "ﱢ", "" },
    -- ["icons"] = { "ﮊ", "" },
    -- ["icons"] = { "", "ﰕ" },
    -- ["icons"] = { "", "" },
    -- ["icons"] = { "", "" },
    ["icons"] = { "█", "" },
    ["border"] = "rounded", -- none | single | double | rounded | solid | shadow
})
require('nvim-highlight-colors').setup({})
