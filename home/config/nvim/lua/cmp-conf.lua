local cmp = require('cmp')

local function map_with_index(tbl, f)
    local t = {}
    for k,v in pairs(tbl) do
        t[k] = f(k, v)
    end
    return t
end
cmp.setup({
  snippet = {
    -- We recommend using *actual* snippet engine.
    -- It's a simple implementation so it might not work in some of the cases.
    expand = function(args)
      unpack = unpack or table.unpack
      local line_num, col = unpack(vim.api.nvim_win_get_cursor(0))
      local line_text = vim.api.nvim_buf_get_lines(0, line_num - 1, line_num, true)[1]
      local indent = string.match(line_text, '^%s*')
      local before = string.sub(line_text, 0, col)
      local after  = string.sub(line_text, col + 1)

      local new_body = map_with_index(
        vim.split(args.body, '\n', true),
        function (k, v) if k > 1 then return indent .. v else return v end end
      )

      local new_col = col
      if #new_body > 1 then
         new_col = #new_body[#new_body]
      else
         new_col = col + #new_body[#new_body]
      end

      local replace = vim.split(before .. table.concat(new_body, '\n') .. after, '\n', true)

      vim.api.nvim_buf_set_lines(0, line_num - 1, line_num, true, replace)
      vim.api.nvim_win_set_cursor(0, {line_num + #new_body - 1, new_col})
    end,
  },
  completion = {
    autocomplete = false
  },
  window = {
    --    completion = cmp.config.window.bordered(),
    --    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ["<CR>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true
    }),
    ["<Tab>"] = cmp.mapping.complete(),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
  }, {
    {
      name = 'buffer',
      option = {
        get_bufnrs = function()
          return vim.api.nvim_list_bufs()
        end
      }
    },
  }, {
    { name = 'path' }
  }
  )
})

-- Set up lspconfig.
-- local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
--  capabilities = capabilities
-- }
