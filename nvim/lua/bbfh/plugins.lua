require("lazy").setup({
    "projekt0n/github-nvim-theme",
    "folke/which-key.nvim",
    "nvim-lua/plenary.nvim",
    "BurntSushi/ripgrep",
    "folke/neodev.nvim",
    "nvim-tree/nvim-web-devicons",
    { "nvim-telescope/telescope.nvim", branch = "0.1.x" },
    "ThePrimeagen/harpoon",
    "nvim-treesitter/nvim-treesitter",
    "mbbill/undotree",
    "tpope/vim-fugitive", -- Git integration
    -- LSP
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "VonHeikemen/lsp-zero.nvim",
    "nvimtools/none-ls.nvim", -- Autocompletion
    "neovim/nvim-lspconfig",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lsp",
    "max397574/colortils.nvim",
    "m4xshen/autoclose.nvim",
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            "3rd/image.nvim",
        }
    },
    "nvim-telescope/telescope-ui-select.nvim"
})
