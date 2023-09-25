vim.g.mapleader = " "

local function open_in_external_cmd(cmd)
  local filename = vim.fn.expand("<cfile>")
  local dirname = vim.fn.expand("%:p:h")
  local full_cmd = cmd .. " " .. vim.fn.shellescape(dirname .. "/" .. filename)
  vim.fn.jobstart(full_cmd, { detach = true })
end

function Open_file_in_new_tab()
  local filename = vim.fn.expand("<cfile>")
  local dirname = vim.fn.expand("%:p:h")
  vim.cmd("tabnew " .. dirname .. "/" .. filename)
end

function Open_file_and_toggle_alpha()
  vim.cmd("tabnew")
  vim.fn.execute(':Alpha')
end

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>pt", vim.cmd.Texplore, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>pr", vim.cmd.RnvimrToggle, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>gi", function() open_in_external_cmd("nsxiv") end, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>gz", function() open_in_external_cmd("zathura") end, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>nt", function() Open_file_and_toggle_alpha() end, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>gf", function() Open_file_in_new_tab() end, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>td", ":TermExec cmd='today;exit' direction='float'<CR>")
vim.keymap.set("n", "<leader>tm", ":TermExec cmd='ncmpcpp;exit' direction='float'<CR>")
vim.keymap.set("n", "<leader>tf", ":ToggleTerm direction='float'<CR>")
vim.keymap.set("n", "<leader>tb", vim.cmd.ToggleTerm, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>sc", vim.cmd.Alpha, { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>j', '<C-W>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>k', '<C-W>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>h', '<C-W>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>l', '<C-W>l', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>J', '<C-W>J', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>K', '<C-W>K', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>L', '<C-W>L', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>H', '<C-W>H', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-d>', { noremap = true, silent = true })

vim.keymap.set("n", "<leader>cl", vim.cmd.VimtexCompile, { noremap = true, silent = true })

function ExecuteTermCommand()
    local vstart = vim.fn.getpos("'<")
    local vend = vim.fn.getpos("'>")

    local line_start = vstart[2]
    local line_end = vend[2]

    local lines = vim.fn.getline(line_start, line_end)

    local selected_text = {}

    for i, line in ipairs(lines) do
        local start_col = (i == 1) and vstart[3] or 1
        local end_col = (i == #lines) and vend[3] or -1
        local line_text = string.sub(line, start_col, end_col)
        table.insert(selected_text, line_text)
    end

    local selected_text_str = table.concat(selected_text, "\n")

    selected_text_str = string.gsub(selected_text_str, "\\lim", "lim")
    selected_text_str = string.gsub(selected_text_str, "\\ dx", " dx")

    local term_command = ":TermExec direction=float cmd='wa \"" .. selected_text_str .. "\"'"

    vim.cmd(term_command)
end

function ExecuteTermCommand2()
    local vstart = vim.fn.getpos("'<")
    local vend = vim.fn.getpos("'>")

    local line_start = vstart[2]
    local line_end = vend[2]

    local lines = vim.fn.getline(line_start, line_end)

    local selected_text = {}

    for i, line in ipairs(lines) do
        local start_col = (i == 1) and vstart[3] or 1
        local end_col = (i == #lines) and vend[3] or -1
        local line_text = string.sub(line, start_col, end_col)
        table.insert(selected_text, line_text)
    end

    local selected_text_str = table.concat(selected_text, "\n")

    selected_text_str = string.gsub(selected_text_str, "\\lim", "lim")
    selected_text_str = string.gsub(selected_text_str, "\\ dx", " dx")

    local term_command = ":TermExec direction=float cmd='words2wa \"" .. selected_text_str .. "\"'"

    vim.cmd(term_command)

end

vim.keymap.set("x", "<leader>sg", ":lua ExecuteTermCommand2()<CR>")

vim.keymap.set("x", "<leader>so", ":lua ExecuteTermCommand()<CR>")

vim.keymap.set("n", "<leader>nn", ":Neorg keybind norg core.dirman.new.note<CR>")
vim.keymap.set("n", "<leader>ttd", ":Neorg keybind norg core.qol.todo_items.todo.task_done<CR>")

vim.keymap.set("n", "<leader>vh", ":new | RnvimrToggle<CR>")
vim.keymap.set("n", "<leader>vv", ":vnew | RnvimrToggle<CR>")

vim.keymap.set("n", "<leader>ve", vim.cmd.VimtexView, { noremap = true, silent = true })

vim.keymap.set("n", "<leader>ww", vim.cmd.WikiIndex, { noremap = true, silent = true })

