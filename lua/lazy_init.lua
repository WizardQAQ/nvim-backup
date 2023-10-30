local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://ghproxy.com/https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    {'hrsh7th/nvim-cmp',
      dependencies = {
        {
          'quangnguyen30192/cmp-nvim-tags',
          -- if you want the sources is available for some file types
          ft = {
            'python',
            'c'}
        }}},
    'SirVer/ultisnips',
    'honza/vim-snippets',
    'quangnguyen30192/cmp-nvim-ultisnips',
    'RRethy/nvim-base16',
    'sainnhe/sonokai',
    'tomasiser/vim-code-dark',
    "rktjmp/lush.nvim",
    "CodeGradox/onehalf-lush",
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
    'onsails/lspkind-nvim',
    'jupyter-vim/jupyter-vim',
    'windwp/nvim-autopairs',
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    { 'Everblush/everblush.nvim', name = 'everblush' },
      {'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    {'mg979/vim-visual-multi', branch = 'master'},
    {'nvim-treesitter/nvim-treesitter',build = ':TSUpdate'},
    {'akinsho/bufferline.nvim', dependencies = 'kyazdani42/nvim-web-devicons'},
    {'nvim-lualine/lualine.nvim',dependencies = { 'kyazdani42/nvim-web-devicons', lazy = true }},
    {'iamcco/markdown-preview.nvim', build = 'cd app && yarn install', cmd = 'MarkdownPreview', ft = {'markdown'}},
    {'kyazdani42/nvim-tree.lua',dependencies = {'kyazdani42/nvim-web-devicons'} },
    {
      'phaazon/hop.nvim',
      branch = 'v2', -- optional but strongly recommended
      config = function()
        -- you can configure Hop the way you like here; see :h hop-config
        require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
      end
    },
    {
      'nvim-telescope/telescope.nvim',
      dependencies = { {'nvim-lua/plenary.nvim'} }
    }
})