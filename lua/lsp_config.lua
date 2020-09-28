local nvim_lsp = require('nvim_lsp')
local completion = require('completion')

local status = require('lib.lsp_status')
local os_check = require('lib.os_check')

local mapper = function(mode, key, result)
  vim.api.nvim_buf_set_keymap(0, mode, key, result, {noremap = true, silent = true})
end

-- Turn on status.
status.activate()

local minimal_attach = function(client)
  completion.on_attach(client)
  status.on_attach(client)

  vim.cmd("setlocal omnifunc=v:lua.vim.lsp.omnifunc")
end

local custom_attach = function(client)
  completion.on_attach(client)
  status.on_attach(client)

  mapper('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
  mapper('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
  mapper('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')

  mapper('n', 'gD', '<cmd>lua vim.lsp.buf.implementation()<CR>')
  mapper('n', 'gdd', '<cmd>lua vim.lsp.buf.declaration()<CR>')
  mapper('n', '<Leader>cr', '<cmd>lua vim.lsp.buf.rename()<CR>')

  -- Rust is currently the only thing w/ inlay hints
  if vim.api.nvim_buf_get_option(0, 'filetype') == 'rust' then
    vim.cmd [[autocmd BufEnter,BufWritePost <buffer> :lua require('lsp_extensions.inlay_hints').request { aligned = true, prefix = " » " }]]
  end

  vim.cmd("setlocal omnifunc=v:lua.vim.lsp.omnifunc")
end

-- Python
nvim_lsp.pyls.setup({
  on_attach = custom_attach
})

-- Golang
nvim_lsp.gopls.setup({
  on_attach = custom_attach,
})

-- VimScript
nvim_lsp.vimls.setup({
  on_attach = custom_attach,
})

-- Lua
os = os_check.get()

if os == "win" then
  nvim_lsp.sumneko_lua.setup({
    cmd = {
      'S:/Dev/misc/lua-language-server/bin/Windows/lua-language-server.exe',
      '-E',
      'S:/Dev/misc/lua-language-server/main.lua',
    },
    on_attach = custom_attach,
  })
elseif os == "unix" then
  nvim_lsp.sumneko_lua.setup({
    cmd = {
      '/home/taras/tmp/lua-language-server/bin/Linux/lua-language-server',
      '-E',
      '/home/taras/tmp/lua-language-server/main.lua',
    },
    on_attach = custom_attach,
  })
end

-- Typescript
nvim_lsp.tsserver.setup({
  cmd = { "typescript-language-server", "--stdio" },
  on_attach = custom_attach,
})

-- Rust
nvim_lsp.rust_analyzer.setup({
  cmd = {"rust-analyzer"},
  on_attach = custom_attach,
})

