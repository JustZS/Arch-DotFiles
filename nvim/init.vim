set number
set nofoldenable
set modifiable
set autoindent smartindent
set conceallevel=1
set spell spelllang=en_us
set iskeyword+=:
set linebreak
call plug#begin()
Plug 'lervag/vimtex'
Plug 'dcampos/nvim-snippy'
Plug 'honza/vim-snippets'
Plug 'AlphaTechnolog/pywal.nvim'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim'
Plug 'vim-pandoc/vim-pandoc'
Plug 'kevinhwang91/rnvimr'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'Pocco81/auto-save.nvim'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-rmarkdown'
Plug 'voldikss/vim-floaterm'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'dcampos/cmp-snippy'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'ryanoasis/vim-devicons'
Plug 'lewis6991/impatient.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'lervag/wiki.vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()
let mapleader = ","
syntax enable
highlight Normal guibg=none
nmap ]x ctrih/^# %%<CR><CR>
colorscheme pywal
imap <expr> <Tab> snippy#can_expand_or_advance() ? '<Plug>(snippy-expand-or-advance)' : '<Tab>'
imap <expr> <S-Tab> snippy#can_jump(-1) ? '<Plug>(snippy-previous)' : '<S-Tab>'
smap <expr> <Tab> snippy#can_jump(1) ? '<Plug>(snippy-next)' : '<Tab>'
smap <expr> <S-Tab> snippy#can_jump(-1) ? '<Plug>(snippy-previous)' : '<S-Tab>'
xmap <Tab> <Plug>(snippy-cut-text)
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd FileType markdown setlocal spell spelllang=en_us
nnoremap <C-u> :FloatermNew<CR>
nnoremap <f9> :FloatermNew python %<CR>
nnoremap <C-r> :RnvimrToggle<CR>
nnoremap <f1> :RMarkdown pdf<CR>
nnoremap <C-l> :VimtexCompile<CR>
nnoremap <C-p> :silent !zathura %:r.pdf &<CR><CR>
nnoremap <f5> :FloatermNew ncmpcpp<CR>
nnoremap <leader>gb ciw\textbf{<ESC>pa}<ESC>
function! OpenFileInNewTab()
  let filename = expand("<cfile>")
  let dirname = expand("%:p:h")
  execute "tabnew " . dirname . "/" . filename
endfunction

autocmd BufReadPost * nnoremap <buffer> <leader>gf :call OpenFileInNewTab()<CR>

function! OpenImageInSxiv()
  let filename = expand("<cfile>")
  let dirname = expand("%:p:h")
  call system("dwmswallow $WINDOWID; sxiv " . dirname . "/" . filename)
endfunction

function! OpenImageInZathura()
  let filename = expand("<cfile>")
  let dirname = expand("%:p:h")
  call system("dwmswallow $WINDOWID; zathura " . dirname . "/" . filename)
endfunction

autocmd BufReadPost * nnoremap <buffer> <leader>gz :call OpenImageInZathura()<CR>

autocmd BufReadPost * nnoremap <buffer> <leader>gi :call OpenImageInSxiv()<CR>

function! MyMacro()
    tabnew
    execute ':RnvimrToggle'
endfunction

nnoremap <C-t> :call MyMacro()<CR>

let g:vimtex_view_method = 'zathura'
let g:vimtex_view_general_viewer = 'zathura'
let g:rnvimr_enable_picker = 1
let g:rnvimr_enable_ex = 1
let g:rmarkdown_output_format = 'pdf_document'
let g:rnvimr_shadow_winblend = 50
let g:wiki_root = '~/Documents/wiki'
lua require'colorizer'.setup()
lua require("mason").setup()
lua require("mason-lspconfig").setup({ensure_installed = { "texlab" },})
lua require("lspconfig").texlab.setup {}
lua require('impatient')
lua require('lualine').setup()

lua <<EOF
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },
    window = {
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), 
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' },
    }, {
      { name = 'buffer' },
    })
  })

  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' },
    }, {
      { name = 'buffer' },
    })
  })

  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })


