return require('packer').startup(function(use)
    use {
        'wbthomason/packer.nvim',
        {
          'phaazon/hop.nvim',
          branch = 'v1', -- optional but strongly recommended
          config = function()
            -- you can configure Hop the way you like here; see :h hop-config
            require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
          end
        },
          }
  end)   
  
