local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- LSP
    'williamboman/mason.nvim',
    'RubixDev/mason-update-all',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
    { "nvimdev/lspsaga.nvim", event = "BufEnter" },
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    -- Formatting and linting
    {
        "jay-babu/mason-null-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "nvimtools/none-ls.nvim",
        },
    },
    -- terminal
    "voldikss/vim-floaterm",
    -- DAP
    { "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } },
    "theHamsta/nvim-dap-virtual-text",
    -- Sources
    {'hrsh7th/nvim-cmp',
      dependencies = {
        {
          'quangnguyen30192/cmp-nvim-tags',
          -- if you want the sources is available for some file types
          ft = {
            'python',
            'c'}
        }}},
    "hrsh7th/vim-vsnip",
    "hrsh7th/cmp-vsnip",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "mortepau/codicons.nvim",
    "rafamadriz/friendly-snippets",
    "onsails/lspkind-nvim",
    -- auto save
    "Pocco81/auto-save.nvim",
    -- leetcode
    {
        "kawre/leetcode.nvim",
        dependencies = {
            "MunifTanjim/nui.nvim",
        }
    },
    -- markdown
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function()
            vim.fn["mkdp#util#install"]()
        end,
    },
    -- codeium
    {
        "Exafunction/codeium.nvim",
    },
    -- comment
    { "numToStr/Comment.nvim" },
    -- file tree
    { "nvim-tree/nvim-web-devicons" },
    { "kyazdani42/nvim-tree.lua",   event = "VimEnter" },
    { "akinsho/bufferline.nvim",    dependencies = { "moll/vim-bbye" } },
    { "nvim-lualine/lualine.nvim" },
    { "arkav/lualine-lsp-progress" },
    -- telescope
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { { 'nvim-lua/plenary.nvim' } }
    },
    "LinArcX/telescope-env.nvim",
    {'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    -- 自动补全
    { "windwp/nvim-autopairs" },

    { "lukas-reineke/indent-blankline.nvim", main = "ibl", tag = "v3.5.4" },
    -- dashboard
    { "nvimdev/dashboard-nvim",              event = "VimEnter", dependencies = { { "nvim-tree/nvim-web-devicons" } } },
    "ahmedkhalf/project.nvim",

    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    -- HOP
    {
        'phaazon/hop.nvim',
        branch = 'v2', -- optional but strongly recommended
        config = function()
            -- you can configure Hop the way you like here; see :h hop-config
            require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
        end
    },
    -- git
    "lewis6991/gitsigns.nvim",
    -- colorscheme
    "tomasiser/vim-code-dark",
    -- UI
	"rcarriga/nvim-notify",
	"nvim-lua/lsp-status.nvim",
	"petertriho/nvim-scrollbar",
    -- multi cursors
    {'mg979/vim-visual-multi', branch = 'master'},
})
