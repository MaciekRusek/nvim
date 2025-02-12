return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      auto_install = true,
      ensure_installed = {
        "lua_ls",
        "gopls",
        "html",
        "cssls",
      }
    },
    dependencies = {
      "williamboman/mason.nvim"
    }
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      --"saghen/blink.cmp",
      "williamboman/mason-lspconfig.nvim",
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function()
      -- local capabilities = require('blink.cmp').get_lsp_capabilities()
      local util = require("lspconfig.util")

      require("lspconfig").lua_ls.setup {}
      require("lspconfig").gopls.setup {
        cmd = { "gopls" },
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
        root_dir = util.root_pattern("go.work", "go.mod", ".git")
      }
      require("lspconfig").pyright.setup {}
      -- require("lspconfig").ocamllsp.setup { capabilities = capabilities }
      -- require("lspconfig").elixirls.setup { capabilities = capabilities }

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client then return end

          if client.supports_method('textDocument/formatting') then
            vim.api.nvim_create_autocmd('BufWritePre', {
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
              end,
            })
          end
        end,
      })
    end,
  }
}
