return {
  {
    "hrsh7th/cmp-nvim-lsp"
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    }
  },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")
      -- add the VSCode Snippets from Friendly-Snippets
      require("luasnip.loaders.from_vscode").lazy_load()
      cmp.setup({
        snippet = {
          -- This is Required
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<Space-w>'] = cmp.mapping.scroll_docs(-4),
          ['<Space-s>'] = cmp.mapping.scroll_docs(4),
          ['<Space-d>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<tab>'] = cmp.mapping.confirm({ select = true }),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = 'luasnip' },
        }, {
          { name = 'buffer' },
        })
      })
    end,
  }
}
