local M = {}

function M.setup()
    set = vim.keymap.set
    set("n", "<leader>b", ":buffer ")

    -- emacs?
    set({ "n", "v" }, "j", "gj")
    set({ "n", "v" }, "k", "gk")
    set({ "n", "v" }, "0", "g0")
    set({ "n", "v" }, "$", "g$")

    -- helix?
    set({ "n", "v" }, "ge", "G")

    -- netrw
    set({ "n", "v" }, "<leader>e", vim.cmd.Explore)

    vim.api.nvim_create_autocmd("FileType", {
        pattern = "netrw",
        callback = function(ev)
            vim.keymap.set("n", "<leader>q", "<cmd>bd<cr>", {
                buffer = ev.buf,
                silent = true,
            })
            vim.keymap.set("n", "<Esc>", "<cmd>bd<cr>", {
                buffer = ev.buf,
                silent = true,
            })
        end,
    })

    -- remote
    vim.keymap.set("n", "<leader>q", "<cmd>detach<cr>", {
      desc = "Detach Neovim UI",
    })
end

return M
