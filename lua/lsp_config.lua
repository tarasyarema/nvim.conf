-- local nvim_lsp = require('lspconfig')

local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
	'lua_ls',
	'jsonls',
	'clangd',
	'elixirls',
	'vimls',
	'pyright',
	'gopls',
	'tsserver',
	'rust_analyzer',
})

lsp.format_on_save({
	servers = {
		["gopls"] = { "go" },
		["eslint"] = { "javascript" },
		["lua_ls"] = { "lua" },
		["tsserver"] = { "typescript" },
		["rust_analyzer"] = { "rust" },
	},
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	['<CR>'] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(),
})


lsp.setup_nvim_cmp({
	mapping = cmp_mappings
})

lsp.set_preferences({
	suggest_lsp_servers = false,
	sign_icons = {
		error = 'E',
		warn = 'W',
		hint = 'H',
		info = 'I'
	}
})

local util = require('lspconfig/util')

local path = util.path

require 'cmp'.setup {
	sources = {
		{ name = 'nvim_lsp' }
	}
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local status = require('lib.lsp_status')

local custom_attach = function(client)
	capabilities.on_attach(client)
end

require("trouble").setup {}

local function get_python_path(workspace)
	-- Use activated virtualenv.
	if vim.env.VIRTUAL_ENV then
		return path.join(vim.env.VIRTUAL_ENV, 'bin', 'python')
	end

	local match = vim.fn.glob(path.join(workspace, 'pyproject.toml'))

	print(workspace)
	print(match)

	if match ~= '' then
		local venv = vim.fn.trim(vim.fn.system('poetry env info -p'))
		local new_path = path.join(venv, 'bin', 'python')

		print(venv)
		print(new_path)

		return new_path
	end

	-- Fallback to system Python.
	return exepath('python3') or exepath('python') or 'python'
end

-- Turn on status.
status.activate()

-- Python
-- nvim_lsp.pyright.setup({
--   on_init = function(client)
--     local root_dir = client.config.root_dir
--     client.config.settings.python.pythonPath = get_python_path(root_dir)
--   end,
--   capabilities = capabilities
-- })

-- -- Golang
-- nvim_lsp.gopls.setup {
--   capabilities = capabilities
-- }

-- -- VimScript
-- nvim_lsp.vimls.setup {
--   capabilities = capabilities
-- }

-- nvim_lsp.lua_ls.setup {
--   capabilities = capabilities,
--   settings = {
--     Lua = {
--       runtime = {
--         -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
--         version = 'LuaJIT',
--       },
--       diagnostics = {
--         -- Get the language server to recognize the `vim` global
--         globals = {'vim'},
--       },
--       workspace = {
--         -- Make the server aware of Neovim runtime files
--         library = vim.api.nvim_get_runtime_file("", true),
--       },
--       -- Do not send telemetry data containing a randomized but unique identifier
--       telemetry = {
--         enable = false,
--       },
--     },
--   },
-- }

-- -- Typescript
-- nvim_lsp.tsserver.setup {
--   capabilities = capabilities,
--   on_attach = function(client)
--     if client.config.flags then
--       client.config.flags.allow_incremental_sync = true
--     end

--     client.server_capabilities.documentFormattingProvider = false

--     custom_attach(client)
--   end
-- }

-- -- HTML
-- nvim_lsp.html.setup {
--   capabilities = capabilities
-- }

-- -- Rust
-- nvim_lsp.rust_analyzer.setup {
--   capabilities = capabilities,
--   settings = {
--     ["rust-analyzer"] = {
--       assist = {
--         importPrefix = "by_self",
--       },
--       cargo = {
--         allFeatures = true,
--       },
--       checkOnSave = {
--         command = "clippy",
--       },
--       lens = {
--         references = true,
--         methodReferences = true,
--       },
--     }
--   }
-- }

-- -- Clang
-- nvim_lsp.clangd.setup {
--   capabilities = capabilities
-- }

-- -- Json
-- nvim_lsp.jsonls.setup {
--   capabilities = capabilities
-- }

-- -- Elixir
-- nvim_lsp.elixirls.setup {
--   cmd = {"/usr/local/bin/elixir-ls/language_server.sh"},
--   capabilities = capabilities
-- }

lsp.setup()
