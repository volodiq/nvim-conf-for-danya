return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local conform = require("conform")

        conform.setup({
            formatters_by_ft = {
                python = { "isort", "black" },
                json = { "fixjson" },
                jsonl = { "fixjson" },
            },
            format_on_save = {
                lsp_fallback = true,
                async = false,
                timeout_ms = 1000,
            },
        })

        conform.formatters.black = {
          prepend_args = { "-l", "120" },
        }

        conform.formatters.isort = {
          prepend_args = { "-l", "120" },
        }

        vim.keymap.set({ "n", "v" }, "<leader>f", function()
            conform.format({
                lsp_fallback = true,
                async = false,
                timeout_ms = 1000,
            })
        end, { desc = "Format file or range (in visual mode)" })
    end,
}

