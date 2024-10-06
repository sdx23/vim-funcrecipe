Vim syntax hilighting and linting for funcrecipes.

# Install

## Lazy

In `.config/nvim/lua/plugins/vim-funcrecipe.lua` add

    return { {
        'sdx23/vim-funcrecipe',
        dependencies = { "nvimtools/none-ls.nvim" },
        config = function()
        end,
        ft = 'recipe',
    } }
