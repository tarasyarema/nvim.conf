function goimports(timeoutms)
    local context = { source = { organizeImports = true } }
    vim.validate { context = { context, "t", true } }

    local params = vim.lsp.util.make_range_params()
    params.context = context

    local method = "textDocument/codeAction"
    local resp = vim.lsp.buf_request_sync(0, method, params, timeoutms)
    if resp and resp[1] then
        local result = resp[1].result
        if result and result[1] then
            local edit = result[1].edit
            vim.lsp.util.apply_workspace_edit(edit)
        end
    end

    vim.lsp.buf.formatting()
end

function go_switch()
    local buffer = vim.api.nvim_get_current_buf()
    local full_name = vim.api.nvim_buf_get_name(buffer)
    local filetype = vim.api.nvim_buf_get_option(buffer, 'filetype')

    if filetype == "go" then
        local is_test = false
        local back_pad = 3 -- .go extension len
        local ext = "." .. filetype

        local name = string.sub(full_name, 1, string.len(full_name) - back_pad)
        if string.match(name, "_test") ~= -1 then
            is_test = true
            back_pad = 8
            ext = "_test" .. ext
        end

        vim.cmd("vs " .. name .. ext)
    end
end
