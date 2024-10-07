local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    tsx = { "prettier" },
    jsx = { "prettier" },
    json = { "prettier" },
    ts = { "prettier", "trim_whitespace" },
    js = { "prettier" },
    rs = { "prettier" },
  },
  formatters = {
    trim_whitespace = {
      command = "sed",
      args = { "-i", "s/\\s\\+/ /g" },
    },
  },
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
