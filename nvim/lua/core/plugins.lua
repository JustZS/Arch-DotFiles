local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

local plugins = {

-- Snippets

  { 'dcampos/nvim-snippy', event = "InsertEnter" },

  { 'dcampos/cmp-snippy', event = "InsertEnter" },

-- LSP/CMP

  { "hrsh7th/nvim-cmp", event = { "InsertEnter", "CmdlineEnter" } },

  { 'hrsh7th/cmp-calc', event = { "InsertEnter", "CmdlineEnter" } },

  { 'hrsh7th/cmp-cmdline', event = { "InsertEnter", "CmdlineEnter" } },

  { 'williamboman/mason.nvim', event = { "InsertEnter", "CmdlineEnter" } },

  { 'williamboman/mason-lspconfig.nvim', event = { "InsertEnter", "CmdlineEnter" } },

  { 'neovim/nvim-lspconfig', event = { "InsertEnter", "CmdlineEnter" } },

  { 'hrsh7th/cmp-nvim-lsp', event = { "InsertEnter", "CmdlineEnter" } },

  { 'hrsh7th/cmp-buffer', event = { "InsertEnter", "CmdlineEnter" } },

  { 'hrsh7th/cmp-path', event = { "InsertEnter", "CmdlineEnter" } },

  { 'hrsh7th/cmp-cmdline', event = { "InsertEnter", "CmdlineEnter" } },

-- Colors

  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate', event = { "BufReadPost", "BufNewFile" } },

  { 'AlphaTechnolog/pywal.nvim', name = 'pywal' },

  { 'norcalli/nvim-colorizer.lua', event = "InsertEnter" },

-- Latex

  { 'lervag/vimtex', ft = "tex" },

  { 'Pocco81/auto-save.nvim', ft = "tex" },

-- Files

  { 'ryanoasis/vim-devicons' },

  { 'kevinhwang91/rnvimr' },

  {
	  "akinsho/toggleterm.nvim", version = '*', config = function()
		  require("toggleterm").setup()
	  end,
	  cmd = { "ToggleTerm", "TermExec" }
  },

  -- Fast Editing

  { 'ggandor/flit.nvim', event = "BufRead" },

  { 'ggandor/leap.nvim', event = "BufRead" },

  { 'numToStr/Comment.nvim', event = "BufRead" },

  { 'windwp/nvim-autopairs', event = "InsertEnter" },

  -- Startup Screen

  {
	  "goolord/alpha-nvim",
	  config = function ()
		  local alpha = require'alpha'
		  local dashboard = require'alpha.themes.dashboard'
		  dashboard.section.header.val = {
			  [[                               __                ]],
			  [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
			  [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
			  [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
			  [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
			  [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
		  }
		  dashboard.section.buttons.val = {
			  dashboard.button( "e", "  New file" , ":ene <BAR> startinsert <CR>"),
			  dashboard.button( "f", "🔎 Find file", ":RnvimrToggle<CR>"),
			  dashboard.button( "r", "⏪ Restore Previous Session", "<cmd>SessionManager load_session<CR>" ),
			  dashboard.button( "p", "🕸️ Open old file", ":Telescope oldfiles theme=dropdown<CR>"),
			  dashboard.button( "t", "📓 Todo", ":TermExec cmd='today;exit' direction='float'<CR>" ),
			  dashboard.button( "q", "󰅚  Quit NVIM" , ":qa<CR>" ),
		  }
		  dashboard.config.opts.noautocmd = true

		  vim.cmd[[autocmd User AlphaReady echo 'ready']]

		  alpha.setup(dashboard.config)
	  end,
  },

  { 'Shatur/neovim-session-manager', event = "BufRead" },

  { 'nvim-telescope/telescope.nvim', dependencies = { 'nvim-lua/plenary.nvim' } },

  { 'stevearc/dressing.nvim' },

  -- Neorg

  {
	  'nvim-neorg/neorg',
	  build = ":Neorg sync-parsers",
	  dependencies = { "nvim-lua/plenary.nvim" },
	  config = function()
		  require("neorg").setup {
			  load = {
				  ["core.defaults"] = {}, -- Loads default behaviour
				  ["core.concealer"] = {}, -- Adds pretty icons to your documents
				  ["core.dirman"] = { -- Manages Neorg workspaces
				  config = {
					  workspaces = {
						  notes = "~/notes",
					  },
				  },
			  },
		  },
	  }
  end,
  ft="norg",
  },

  -- Markdown

  {
	  'iamcco/markdown-preview.nvim',
	  build = 'cd app && npm install',
	  init = function()
		  vim.g.mkdp_filetypes = { 'markdown' }
	  end,
	  config = function()
		  vim.keymap.set("n", "<leader>m", "<Plug>MarkdownPreviewToggle", { desc = "Markdown Preview" })
	  end,
	  ft="markdown",
  },

  -- Misc

  'nvim-lualine/lualine.nvim',

  { 'lervag/wiki.vim', ft = "markdown", cmd = "WikiIndex" },

  {
	  'folke/noice.nvim',
	  dependencies = {
		  'MunifTanjim/nui.nvim',
		  'rcarriga/nvim-notify',
	  },
	  event = "BufRead",
  },

  'lewis6991/impatient.nvim',

  { 'lukas-reineke/indent-blankline.nvim', event = "BufRead" },

}

local opts = {}

require("lazy").setup(plugins, opts)
