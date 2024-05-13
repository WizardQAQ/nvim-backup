 if exists('g:vscode')
    let mapleader = " "
    let g:python3_host_prog = '/home/gll/.conda/envs/matExplorer/bin/python'
    lua require('vscodePlugins')
    lua require('config/autopairs')
    lua require('config/vscodeSetting')
    nnoremap <silent><leader>hw :HopWord<CR>
    nnoremap <silent><leader>hl :HopLine<CR>
    nnoremap go <Cmd>call VSCodeNotify('workbench.action.quickOpen')<CR>
    noremap <C-d> <Cmd>call VSCodeNotifyVisual('editor.action.addSelectionToNextFindMatch', 1)<CR>   
else    
    let mapleader = " " 
    set mouse=a
    lua require('lazy_init')
    " lua require('plugins')
    lua require('config/cmp_mason')
    lua require('config/BasicPlugins')
    lua require('config/autopairs')
    set completeopt=menu,menuone,noselect
    colorscheme codedark
    " colorscheme everblush
    " set background=light
    " colorscheme base16-one-light
    let g:python3_host_prog = '/usr/bin/python3'

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

    nnoremap <silent><leader>hw :HopWord<CR>
    nnoremap <silent><leader>hl :HopLine<CR>

    nnoremap <silent><leader>jc :JupyterConnect<CR>
    nnoremap <silent><leader>jr :JupyterRunFile<CR>
    nnoremap <silent><leader>jq :!jupyter qtconsole &<CR>
endif

let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif
