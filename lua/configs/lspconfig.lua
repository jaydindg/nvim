-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"
local nvlsp = require "nvchad.configs.lspconfig"

-- configuring single server, example: typescript
lspconfig.ts_ls.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
}

lspconfig.omnisharp.setup {
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  cmd = { vim.fn.stdpath "data" .. "/mason/bin/omnisharp.cmd" },
  enable_ms_build_load_projects_on_demand = false,
  enable_editorconfig_support = true,
  enable_roslyn_analysers = true,
  enable_import_completion = true,
  organize_imports_on_format = true,
  enable_decompilation_support = true,
  analyze_open_documents_only = false,
  filetypes = { "cs", "vb", "csproj", "sln", "slnx", "props", "csx", "targets" },
}

-- configuring rust-analyzer
lspconfig.rust_analyzer.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
      },
    },
  },
}

lspconfig.tailwindcss.setup {
  on_attach = function(client, bufnr)
    require('tailwindcss-bolors').buf_attach(bufnr)
  end,
}

-- EXAMPLE
local servers = { "html", "cssls", "ts_ls", "marksman", "jsonls", "rust_analyzer", "omnisharp", "tailwindcss" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
    userLanguages = {
      eelixir = "html-eex",
      eruby = "erb",
      rut = "html",
    },
  }
end
