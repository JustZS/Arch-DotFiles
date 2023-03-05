:set number
:set modifiable
:set nofoldenable
call plug#begin()
Plug 'lervag/vimtex'
Plug 'dcampos/nvim-snippy'
Plug 'honza/vim-snippets'
Plug 'preservim/nerdtree'
Plug 'mhinz/vim-startify'
Plug 'AlphaTechnolog/pywal.nvim', { 'as': 'pywal' }
Plug 'ryanoasis/vim-devicons'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'vim-pandoc/vim-pandoc'
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
Plug 'vim-pandoc/vim-rmarkdown'
Plug 'vim-pandoc/vim-pandoc-syntax'
call plug#end()
syntax enable
colorscheme pywal
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
let g:vimtex_view_method = 'zathura'
let g:vimtex_view_general_viewer = 'okular'
imap <expr> <Tab> snippy#can_expand_or_advance() ? '<Plug>(snippy-expand-or-advance)' : '<Tab>'
imap <expr> <S-Tab> snippy#can_jump(-1) ? '<Plug>(snippy-previous)' : '<S-Tab>'
smap <expr> <Tab> snippy#can_jump(1) ? '<Plug>(snippy-next)' : '<Tab>'
smap <expr> <S-Tab> snippy#can_jump(-1) ? '<Plug>(snippy-previous)' : '<S-Tab>'
xmap <Tab> <Plug>(snippy-cut-text)
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-t> :tabnew<CR>
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd FileType markdown setlocal spell spelllang=en_us
nnoremap <F9> :w<CR>:redir @a<CR>:silent !python %<CR>:redir END<CR>:echo @a<CR>
lua require("toggleterm").setup()
nnoremap <C-u> :ToggleTerm<CR>
nnoremap <C-r> :w<CR>:RMarkdown<CR>
