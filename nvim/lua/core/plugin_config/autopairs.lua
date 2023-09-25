local npairs = require('nvim-autopairs')
local Rule = require('nvim-autopairs.rule')
local cond = require('nvim-autopairs.conds')

npairs.setup({})

npairs.add_rules({
  Rule("$", "$", "tex")
    :with_move(cond.not_before_text("$"))
    :with_move(cond.after_text("$"))
})

