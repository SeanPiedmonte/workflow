-- lua/piedmonte/lsp/diagnostics.lua

-- Faster CursorHold
vim.o.updatetime = 250

-- Diagnostic display config
vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    underline = true,
    update_in_insert = false,
})

-- Echo diagnostics in the command line
vim.api.nvim_create_autocmd("CursorHold", {
    callback = function()
        local diagnostics = vim.diagnostic.get(0, {
        lnum = vim.fn.line(".") - 1,
    })

    if #diagnostics == 0 then
        vim.api.nvim_echo({}, false, {})
        return
    end

    local d = diagnostics[1]

    local icons = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN]  = " ",
      [vim.diagnostic.severity.INFO]  = " ",
      [vim.diagnostic.severity.HINT]  = "󰌵 ",
    }

    vim.api.nvim_echo({
        { icons[d.severity] .. d.message, "DiagnosticError" }
    }, false, {})
    end,
})
