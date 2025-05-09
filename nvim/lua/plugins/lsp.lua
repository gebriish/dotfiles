return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "onsails/lspkind.nvim",
    },
    config = function()
      local lspconfig = require("lspconfig")
      local mason = require("mason")
      local mason_lspconfig = require("mason-lspconfig")
      local lspkind = require("lspkind")

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.formatting = {
        dynamicRegistration = false,
      }

      mason.setup()

      mason_lspconfig.setup({
        ensure_installed = { "clangd", "lua_ls" },
        handlers = {
          function(server_name)
            local opts = {
              capabilities = capabilities,
							on_attach = function(client, bufnr)
								vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "Go to definition" })
								vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr, desc = "Go to declaration" })
								vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = bufnr, desc = "Go to implementation" })
								vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = bufnr, desc = "Show references" })
								vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "Show documentation" })
								vim.keymap.set("n", "<leader>ls", vim.lsp.buf.document_symbol, { buffer = bufnr, desc = "Show document symbols" })
								vim.keymap.set("n", "<leader>ws", vim.lsp.buf.workspace_symbol, { buffer = bufnr, desc = "Show workspace symbols" })
								vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, { buffer = bufnr, desc = "Show line diagnostics" })
								vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr, desc = "Rename symbol" })
							end,
            }

            if server_name == "lua_ls" then
              opts.settings = {
                Lua = {
                  diagnostics = {
                    globals = { "vim" },
                  },
                  workspace = {
                    checkThirdParty = false,
                    library = vim.api.nvim_get_runtime_file("", true),
                  },
                },
              }
            end

            lspconfig[server_name].setup(opts)
          end,
        },
      })

      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        float = {
          border = "rounded",
        },
      })

      lspkind.init()
    end,
  },
}
