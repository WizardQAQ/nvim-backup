if exists('g:vscode')
    let mapleader = " "
    let g:python3_host_prog = '/home/gll/.conda/envs/cgcnn/bin/python'
    lua require('vscodePlugins')
    lua require('config/autopairs')
    lua require('config/vscodeSetting')
    nnoremap <silent><leader>hw :HopWord<CR>
    nnoremap <silent><leader>hl :HopLine<CR>
else    
    let mapleader = " " 
    lua require('plugins')
    lua require('config/tmp_cmp')
    lua require('config/BasicPlugins')
    lua require('config/autopairs')
    set completeopt=menu,menuone,noselect
    colorscheme codedark
    " let g:python3_host_prog = '/home/gll/.conda/envs/a/bin/python'

    nnoremap <leader>t :NvimTreeToggle<CR>
    nnoremap <leader>r :NvimTreeRefresh<CR>
    nnoremap <leader>mk :MarkdownPreview<CR>
    nnoremap <leader>ms :MarkdownPreviewStop<CR>

    nnoremap <leader>ff <cmd>Telescope find_files<cr>
    nnoremap <leader>fg <cmd>Telescope live_grep<cr>
    nnoremap <leader>fb <cmd>Telescope buffers<cr>
    nnoremap <leader>fh <cmd>Telescope help_tags<cr>
    nnoremap <leader>fd <cmd>Telescope find_files hidden=true<cr>

    nnoremap <silent><leader>1 <Cmd>BufferLineGoToBuffer 1<CR>
    nnoremap <silent><leader>2 <Cmd>BufferLineGoToBuffer 2<CR>
    nnoremap <silent><leader>3 <Cmd>BufferLineGoToBuffer 3<CR>
    nnoremap <silent><leader>4 <Cmd>BufferLineGoToBuffer 4<CR>
    nnoremap <silent><leader>5 <Cmd>BufferLineGoToBuffer 5<CR>
    nnoremap <silent><leader>6 <Cmd>BufferLineGoToBuffer 6<CR>
    nnoremap <silent><leader>7 <Cmd>BufferLineGoToBuffer 7<CR>
    nnoremap <silent><leader>8 <Cmd>BufferLineGoToBuffer 8<CR>
    nnoremap <silent><leader>9 <Cmd>BufferLineGoToBuffer 9<CR>
    nnoremap <silent><leader>bp :BufferLinePick<CR>
    nnoremap <silent><leader>bpc :BufferLinePickClose<CR>

    nnoremap <silent><leader>h :HopWord<CR>
    nnoremap <silent><leader>hl :HopLine<CR>

    nnoremap <silent><leader>jc :JupyterConnect<CR>
    nnoremap <silent><leader>jr :JupyterRunFile<CR>
    nnoremap <silent><leader>jq :!jupyter qtconsole &<CR>
endif