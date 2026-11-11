local M = {}

local servers = { "tsgo", "gopls", "zls" }

function M.setup()
    -- TypeScript 7
    vim.lsp.config("tsgo", {
        cmd = { "tsc", "--lsp", "--stdio" },
        filetypes = {
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
        },
        root_markers = {
            "tsconfig.json",
            "jsconfig.json",
            "package.json",
            ".git",
        },
    })

    -- Go
    vim.lsp.config("gopls", {
        cmd = { "gopls" },
        filetypes = {
            "go",
            "gomod",
            "gowork",
            "gotmpl",
        },
        root_markers = {
            "go.work",
            "go.mod",
            ".git",
        },
    })

    -- Zig
    vim.lsp.config("zls", {
        cmd = { "zls" },
        filetypes = { "zig" },
        root_markers = { "build.zig" },
        workspace_required = false,
    })

    -- Enable language servers
    vim.lsp.enable(servers)

    -- LSP completion
    local group = vim.api.nvim_create_augroup("UserLspCompletion", {
        clear = true,
    })

    vim.api.nvim_create_autocmd("LspAttach", {
        group = group,
        callback = function(ev)
            local client = vim.lsp.get_client_by_id(ev.data.client_id)

            if not client:supports_method("textDocument/completion") then
                return
            end

            -- Manual completion only
            vim.lsp.completion.enable(
                true,
                client.id,
                ev.buf,
                { autotrigger = false }
            )

            vim.keymap.set("i", "<C-Space>", function()
                if vim.fn.pumvisible() == 1 then
                    return "<C-y>"
                end

                vim.lsp.completion.get()
                return ""
            end, {
                buffer = ev.buf,
                expr = true,
                desc = "Trigger or accept completion",
            })

            vim.keymap.set("i", "<Tab>", function()
                if vim.fn.pumvisible() == 1 then
                    return "<C-n>"
                end
                return "<Tab>"
            end, {
                buffer = ev.buf,
                expr = true,
                silent = true,
            })

            vim.keymap.set("i", "<S-Tab>", function()
                if vim.fn.pumvisible() == 1 then
                    return "<C-p>"
                end
                return "<S-Tab>"
            end, {
                buffer = ev.buf,
                expr = true,
                silent = true,
            })
        end,
    })
end

return M
