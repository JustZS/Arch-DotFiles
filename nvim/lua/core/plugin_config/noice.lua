require("noice").setup({
	views = {
		cmdline_popup = {
			position = {
				row = 20,
				col = "50%",
			},
			size = {
				width = 60,
				height = "auto",
			},
		},
		popupmenu = {
			relative = "editor",
			position = {
				row = 8,
				col = "50%",
			},
			size = {
				width = 60,
				height = 10,
			},
			border = {
				style = "rounded",
				padding = { 0, 2 },
			},
			win_options = {
				winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
			},
		},
	},

	lsp = { progress = { enabled = false }}
})
require("notify").setup({
    background_colour = "NotifyBackground",
    fps = 360,
    icons = {
      DEBUG = "",
      ERROR = "",
      INFO = "",
      TRACE = "✎",
      WARN = ""
    },
    level = 2,
    minimum_width = 50,
    render = "compact",
    stages = "slide",
    timeout = 2000,
    top_down = false,
	opacity = 50,
  }
  )
