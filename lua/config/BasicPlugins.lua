-- settings of indent blankline plugin
vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")
local highlight = {
  "CursorColumn",
  "Whitespace",
}
require("ibl").setup {
    indent = {
      char = " ",
      highlight = highlight
    },
    whitespace = {
      remove_blankline_trail = true,
      highlight = highlight
    }
}

-- settings of buffer line
vim.opt.termguicolors = true
require("bufferline").setup{
    options = {
--        diagnostics = "nvim_lsp",
        offsets = {{
          filetype = "NvimTree",
          text = "File Explorer",
          highlight = "Directory",
          text_align = "left"
        }}
    }
}

-- settings of NvimTree
require'nvim-tree'.setup {
    -- 不显示 git 状态图标
    git = {
        enable = true
    }
}

-- settings of lualine
require('lualine').setup {
    options = {
      icons_enabled = true,
      theme = 'everblush',
      component_separators = { left = '', right = ''},
      section_separators = { left = '', right = ''},
      disabled_filetypes = {},
      always_divide_middle = true,
    },
    sections = {
      lualine_a = {'mode'},
      lualine_b = {'branch', 'diff', 'diagnostics'},
      lualine_c = {'filename'},
      lualine_x = {'encoding', 'fileformat', 'filetype'},
      lualine_y = {'progress'},
      lualine_z = {'location'}
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {'filename'},
      lualine_x = {'location'},
      lualine_y = {},
      lualine_z = {}
    },
    tabline = {},
    extensions = {}
  }


-- settings of treesitter
require'nvim-treesitter.configs'.setup {
    -- 安装 language parser
    -- :TSInstallInfo 命令查看支持的语言
    ensure_installed = {"html", "css", "vim", "lua", "javascript", "python", "bibtex","c","cmake","cpp","comment","cuda","dot","fortran","go","julia","json","latex","markdown","perl","r","regex","ruby","rust"},
    -- 启用代码高亮功能
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = true
    },
    -- 启用增量选择
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = '<CR>',
        node_incremental = '<CR>',
        node_decremental = '<BS>',
        scope_incremental = '<TAB>',
      }
    },
    -- 启用基于Treesitter的代码格式化(=) . NOTE: This is an experimental feature.
    indent = {
      enable = false
    }
  }
  -- 开启 Folding
  vim.wo.foldmethod = 'expr'
  vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
  -- 默认不要折叠
  -- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
  vim.wo.foldlevel = 99
