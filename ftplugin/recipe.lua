-- Filetype-specific settings for funcrecip
if vim.b.did_ftplugin then
  return
end
vim.b.did_ftplugin = 1

-- Set up any filetype-specific options, mappings, or commands here
vim.bo.commentstring = '#%s'
vim.bo.tabstop = 2
vim.bo.shiftwidth = 2
vim.bo.expandtab = true

-- Load null-ls configuration for funcrecip
local null_ls = require("null-ls")
local helpers = require("null-ls.helpers")

local funcrecip_lint = {
  name = "funcrecip-exe",
  method = null_ls.methods.DIAGNOSTICS,
  filetypes = { "recipe" },
  generator = null_ls.generator({
    command = "funcrecip-exe",
    args = { "lint" },
    to_stdin = true,
    format = "line",
    check_exit_code = function(code)
      return code <= 1
    end,
    on_output = helpers.diagnostics.from_patterns({
      {
        pattern = [[:(%d+):(%d+):%s+(.+)]],
        groups = { "row", "col", "message" },
      },
    }),
  }),
}

null_ls.register(funcrecip_lint)

-- Set up autocmd for linting on save
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.md",
  callback = function()
    vim.cmd("lua vim.diagnostic.show()")
  end,
})
