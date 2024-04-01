require('user.options')
require('user.keymaps')
require('user.plugins')

require('lualine').setup()
require("nvim-tree").setup()
require("telescope").setup()
require("mason").setup()
require("mason-lspconfig").setup()

-- Plugin configurations
require('user.luasnip')
require('user.cmp')
require("user.rust-tools")
require("user.treesitter")

vim.cmd.filetype('plugin indent on')
vim.cmd.colorscheme('catppuccin')
vim.cmd.highlight('DiagnosticUnderlineHint cterm=underline gui=undercurl guisp=#94e2d5')
vim.cmd.highlight('DiagnosticUnderlineError cterm=underline gui=undercurl guisp=#f38ba8')
vim.cmd.highlight('DiagnosticUnderlineWarn cterm=underline gui=undercurl guisp=#f9e2af')

local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Source: https://vi.stackexchange.com/questions/39074/user-borders-around-lsp-floating-windows
local _border = "single"

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, {
    border = _border
  }
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help, {
    border = _border
  }
)

vim.diagnostic.config{
  float={border=_border}
}
