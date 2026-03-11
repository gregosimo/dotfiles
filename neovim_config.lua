vim.lsp.config('harper_ls', {
        filetypes = { "asciidoc", "c", "cpp", "cs", "gitcommit", "go", "html", "java", "javascript", "lua", "markdown", "nix", "python", "ruby", "rust", "swift", "tex", "toml", "typescript", "typescriptreact", "haskell", "cmake", "typst", "php", "dart", "clojure", "sh", },
        settings = {
                ["harper-ls"] = {
                        linters = {
--                                Spaces = false,
--                                LongSentences = false,
--                                NoFrenchSpaces = false
                        },
                },
        },
        on_attach = function(client, bufnr)
                local ft = vim.bo[bufnr].filetype
                print(client.config.settings)
                if ft == "tex" or ft == "latex" then
                        client.config.settings["harper-ls"].linters.Spaces = false
                        client.config.settings["harper-ls"].linters.LongSentences = false
                        client.config.settings["harper-ls"].linters.NoFrenchSpaces = false
                else 
                        client.config.settings["harper-ls"].linters.Spaces = true
                        client.config.settings["harper-ls"].linters.LongSentences = true
                        client.config.settings["harper-ls"].linters.NoFrenchSpaces = true
                end
                        client.notify("workspace/didChangeConfiguration", {
                        settings = client.config.settings,
                })
        end,
        --]]
})

vim.lsp.enable('harper_ls')

local function quick_fix_harper()
        vim.lsp.buf.code_action({
                filter = function(action)
                        return action.title:find("Ignore Harper")
                end,
                apply = true
        })
end

vim.keymap.set('n', 'grg', quick_fix_harper, { desc = "Automatically Ignore Harper Error" })
