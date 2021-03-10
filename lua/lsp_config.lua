local nvim_lsp = require('lspconfig')
local completion = require('completion')

local status = require('lib.lsp_status')

local mapper = function(mode, key, result)
  vim.api.nvim_buf_set_keymap(0, mode, key, result, {noremap = true, silent = true})
end

-- Turn on status.
status.activate()

local minimal_attach = function(client)
  completion.on_attach(client)
  status.on_attach(client)
end

local custom_attach = function(client)
  completion.on_attach(client)
  status.on_attach(client)
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
local sumneko_root_path
local system_name

if vim.fn.has("mac") == 1 then
  sumneko_root_path = "/Users/taras/tmp/lua-language-server"
  system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
  sumneko_root_path = "/home/taras/tmp/lua-language-server"
  system_name = "Linux"
elseif vim.fn.has('win32') == 1 then
  sumneko_root_path = "S:/Dev/misc/lua-language-server"
  system_name = "Windows"
else
  print("Unsupported system for sumneko")
end

-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"

nvim_lsp.sumneko_lua.setup({
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
      },
    },
  },
  on_attach = custom_attach,
})

-- Typescript
nvim_lsp.tsserver.setup({
  on_attach = custom_attach,
})

-- Javascript static checker
nvim_lsp.flow.setup{
  on_attach = custom_attach,
}

-- HTML
nvim_lsp.html.setup{
  on_attach = custom_attach,
}

-- Rust
nvim_lsp.rust_analyzer.setup({
  cmd = {"rust-analyzer"},
  on_attach = custom_attach,
})

-- Clang
nvim_lsp.clangd.setup({
  on_attach = custom_attach,
})

-- Json
nvim_lsp.jsonls.setup({
  on_attach = custom_attach,
})

-- PHP
nvim_lsp.intelephense.setup({
  on_attach = custom_attach,
})

-- LaTeX
nvim_lsp.texlab.setup({
  on_attach = custom_attach,
})

-- Java
-- nvim_lsp.jdtls.setup({
--   on_attach = custom_attach,
-- })


-- Elixir
nvim_lsp.elixirls.setup({
  cmd = {"/usr/local/bin/elixir-ls/language_server.sh"},
  on_attach = custom_attach,
})
