local cmp = require'cmp'
local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")
cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ["<Tab>"] = cmp.mapping(
        function(fallback)
        cmp_ultisnips_mappings.compose { "jump_forwards", "select_next_item", "expand" } (fallback)
        end
      ),
      ["<S-Tab>"] = cmp.mapping(
        function(fallback)
            cmp_ultisnips_mappings.compose { "jump_backwards", "select_prev_item" } (fallback)
            end
      ),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'ultisnips' }, -- For ultisnips users.
    { name = 'buffer' },
    { name = 'path' },
  })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' },
    { name = 'cmdline' }
  })
})

-- Use lsp installer to install servers
local lsp_installer = require "nvim-lsp-installer"
lsp_installer.settings({
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})
lsp_installer.setup {}
local lspconfig = require("lspconfig")
-- local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local servers = { 'clangd', 'pyright', 'tsserver', 'bashls', 'grammarly', 'jsonls', 'julials', 'vimls', 'sumneko_lua'}
local capabilities = vim.lsp.protocol.make_client_capabilities()

for _, server in ipairs(lspinstaller.get_installed_servers()) do
  lspconfig[server.name].setup{
    on_attach = function()
      nmap('gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
      nmap('gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
      nmap('K', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
      nmap('gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
      nmap('<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
      nmap('<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
      nmap('<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')
      nmap('gr', '<cmd>lua vim.lsp.buf.references()<CR>')
      nmap('<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>')
      nmap('<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>')
    end,

    flags = {
      debounce_text_changes = 150,
    },

    capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
  }
end
