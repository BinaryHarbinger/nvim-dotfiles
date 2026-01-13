return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- Define all your LSP servers
      local servers = {
        clangd = {},
        pyright = {},
        lua_ls = {},
        ts_ls = {},
        bashls = {},
        rust_analyzer = {},
        cssls = {},
        yamlls = {},
        jsonls = {},
      }

      -- Register each server with vim.lsp.config
      for name, config in pairs(servers) do
        vim.lsp.config(name, config)
      end

      -- Enable LSP automatically when opening files
      vim.api.nvim_create_autocmd('FileType', {
        callback = function()
          -- Enable all configured LSP servers for this buffer
          for name in pairs(servers) do
            vim.lsp.enable(name)
          end
        end,
      })
    end,
  },
}
