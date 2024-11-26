vim.cmd('source ~/.vimrc')

require('packer').startup(function(use)
    use 'github/copilot.vim'
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {'nvim-tree/nvim-web-devicons' -- optional
        }
    }
end)

require("nvim-tree").setup()
