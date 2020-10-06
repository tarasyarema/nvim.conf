local init = function(settings)
    -- Require all lua packages
    for _, v in pairs(settings.packages) do
        require(v)
    end
end

return init({
    packages = {
        'lsp_config',
        'go',
    }
})
