local M = {}

function M.setup()
    vim.api.nvim_create_autocmd("FileType", {
        pattern = { "javascript", "typescript", "typescriptreact", "html", "css", "json" },
        callback = function()
            vim.opt_local.expandtab = true
            vim.opt_local.tabstop = 2
            vim.opt_local.shiftwidth = 2
            vim.opt_local.softtabstop = 2
        end,
    })

    vim.api.nvim_create_autocmd("FileType", {
        pattern = { "go" },
        callback = function()
            vim.opt_local.expandtab = false
            vim.opt_local.tabstop = 4
            vim.opt_local.shiftwidth = 4
            vim.opt_local.softtabstop = 0
        end,
    })
end

return M
