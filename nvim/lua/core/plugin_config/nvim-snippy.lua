require('snippy').setup({
    mappings = {
        is = {
            ['<Tab>'] = 'expand_or_advance',
            ['<S-Tab>'] = 'previous',
        },
    },
})

local mappings = require('snippy.mapping')

vim.keymap.set('i', '<CR>', mappings.expand_or_advance('<Tab>'))
