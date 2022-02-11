let mapleader = " " 
lua require('plugins')
lua require('config/cmp')
lua require('config/BasicPlugins')
lua require('config/autopairs')
set completeopt=menu,menuone,noselect
colorscheme base16-onedark

nnoremap <leader>t :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>m :MarkdownPreview<CR>
nnoremap <leader>mc :MarkdownPreviewStop<CR>

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>