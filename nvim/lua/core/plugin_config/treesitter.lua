require'nvim-treesitter.configs'.setup {
  ensure_installed = { "javascript", "typescript", "c", "lua", "vim", "vimdoc", "query", "markdown" },

  sync_install = false,

  autopairs = {
	  enable = true,
  },

  auto_install = true,

  highlight = {
    enable = true,
    disable = { "latex" },
    additional_vim_regex_highlighting = { "latex", "markdown" },
  },
}
