vim.lsp.config('harper_ls', {
        filetypes = { "asciidoc", "c", "cpp", "cs", "gitcommit", "go", "html", "java", "javascript", "lua", "markdown", "nix", "python", "ruby", "rust", "swift", "tex", "toml", "text", "typescript", "typescriptreact", "haskell", "cmake", "typst", "php", "dart", "clojure", "sh", "rst"},
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
                        client:notify("workspace/didChangeConfiguration", {
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

-- This is a work-related setting to help make project feedback work better.
-- This is really only needed for doing ScaleAI work.
vim.filetype.add({
    pattern = {
        ['${HOME}/Project_Feedback/*'] = 'project'
    }
})

-- A configuration for parrot.nvim
require("parrot").setup {
  -- Providers must be explicitly set up to make them available.
     providers = {
      anthropic = {
        name = "anthropic",
        endpoint = "https://api.anthropic.com/v1/messages",
        model_endpoint = "https://api.anthropic.com/v1/models",
        api_key = os.getenv("ANTHROPIC_API_KEY"),
        params = {
          chat = { max_tokens = 4096 },
          command = { max_tokens = 4096 },
        },
        topic = {
          model = "claude-4-5-haiku-latest",
          params = { max_tokens = 32 },
        },
        headers = function(self)
          return {
            ["Content-Type"] = "application/json",
            ["x-api-key"] = self.api_key,
            ["anthropic-version"] = "2023-06-01",
          }
        end,
        models = {
          "claude-sonnet-4-20250514",
          "claude-3-7-sonnet-20250219",
          "claude-3-5-sonnet-20241022",
          "claude-3-5-haiku-20241022",
        },
        preprocess_payload = function(payload)
          for _, message in ipairs(payload.messages) do
            message.content = message.content:gsub("^%s*(.-)%s*$", "%1")
          end
          if payload.messages[1] and payload.messages[1].role == "system" then
            -- remove the first message that serves as the system prompt as anthropic
            -- expects the system prompt to be part of the API call body and not the messages
            payload.system = payload.messages[1].content
            table.remove(payload.messages, 1)
          end
          return payload
            end,
          },
    },     
    hooks = {
        ResumeCheck = function(prt, params)
            local chat_prompt = [[
            I am applying to a (Title) at (Company). I attached my resume below, as well as the job description. Let me know about what recommendations you might have to better highlight the overlap with the job description. Focus on the language and structure to highlight the overlap, do not recommend wording that suggests experiences that are not included in my cover letter. I want to highlight my existing experience without misrepresenting myself in any way.
            ]]
            prt.ChatNew(params, chat_prompt)
        end,
    }
}


