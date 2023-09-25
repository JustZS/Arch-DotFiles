local set = vim.opt
set.nu = true
set.wrap = true
set.smartindent = true
set.termguicolors = true
set.incsearch = true
set.tabstop = 4
set.shiftwidth = 4
set.shiftwidth = 4

vim.g.wiki_root = '~/Documents/wiki'

local cmd = vim.cmd
cmd("autocmd BufNewFile,BufRead *.md set filetype=markdown")
cmd("autocmd FileType markdown setlocal spell spelllang=en_us")
cmd("autocmd FileType tex setlocal spell spelllang=en_us")

vim.g.rnvimr_action = {
  ['<C-t>'] = 'NvimEdit tabedit',
  ['<C-x>'] = 'NvimEdit split',
  ['<C-v>'] = 'NvimEdit vsplit',
  gw = 'JumpNvimCwd',
  yw = 'EmitRangerCwd'
}

vim.loader.enable()

