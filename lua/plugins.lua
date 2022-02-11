return require('packer').startup(function(use)
    use {
        'wbthomason/packer.nvim',
        'neovim/nvim-lspconfig',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/nvim-cmp',
        'SirVer/ultisnips',
        'honza/vim-snippets',
        'quangnguyen30192/cmp-nvim-ultisnips',
        'RRethy/nvim-base16',
        'sainnhe/sonokai',
        'lukas-reineke/indent-blankline.nvim',
        'williamboman/nvim-lsp-installer',
        'jupyter-vim/jupyter-vim',
        'windwp/nvim-autopairs',
        {'mg979/vim-visual-multi', branch = 'master'},
        {'nvim-treesitter/nvim-treesitter',run = ':TSUpdate'},
        {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'},
        {'nvim-lualine/lualine.nvim',requires = { 'kyazdani42/nvim-web-devicons', opt = true }},
        {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview', ft = {'markdown'}},
        {'kyazdani42/nvim-tree.lua',requires = {'kyazdani42/nvim-web-devicons'} },
	{
	  'phaazon/hop.nvim',
	  branch = 'v1', -- optional but strongly recommended
	  config = function()
	    -- you can configure Hop the way you like here; see :h hop-config
	    require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
	  end
	},
	{
	  'nvim-telescope/telescope.nvim',
	  requires = { {'nvim-lua/plenary.nvim'} }
	}
    }
  end) 
