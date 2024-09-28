local function yank_diagnostic_message()
  local diagnostics = vim.diagnostic.get(0, { lnum = vim.fn.line('.') - 1 })

  if #diagnostics == 0 then
    print("No diagnostics available at the current cursor position.")
    return
  end

  local message = diagnostics[1].message
  vim.fn.setreg("+", message)

  print("Diagnostic message yanked to clipboard: " .. message)
end

vim.keymap.set('n', '<leader>yd', yank_diagnostic_message, { noremap = true, silent = true, desc = "[LSP] Yank Diagnostic Message" })

local function translate_diagnostic_message()
  local diagnostics = vim.diagnostic.get(0, { lnum = vim.fn.line('.') - 1 })
  if #diagnostics == 0 then
    print("No diagnostics available at the current cursor position.")
    return
  end

  local message = diagnostics[1].message
  local command = string.format(":Translate --engine=google,youdao \"%s\"", message)
  vim.cmd(command)
end

vim.keymap.set('n', '<leader>td', translate_diagnostic_message, { noremap = true, silent = true, desc = "[LSP] Translate Diagnostic Message" })

function YankLastCommandOutput()
  
  if vim.bo.buftype ~= "terminal" then
    print("This is not a terminal buffer!")
    return
  end
  
  local prompt_pattern = "%[.*@.*% .*(.*) NL%]%$.*$"
  
  local last_line_num = vim.api.nvim_buf_line_count(0)
  local lines = vim.api.nvim_buf_get_lines(0, 0, last_line_num, false)

  local start_line = nil
  local end_line = nil
  
  for i = last_line_num, 1, -1 do
    if lines[i]:match(prompt_pattern) then
      if not end_line then
        
        end_line = i
      elseif not start_line then
        
        start_line = i + 1
        break
      end
    end
  end
  
  if start_line and end_line then
    
    local yank_start = start_line
    local yank_end = end_line - 1
    
    if yank_start <= yank_end then
      vim.cmd(string.format("%d,%dyank", yank_start, yank_end))
      print("Yanked lines from last command output!")
    else
      print("No command output to yank!")
    end
  else
    print("Could not find two prompt patterns!")
  end
end

vim.api.nvim_set_keymap('n', '<C-y>', ':lua YankLastCommandOutput()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<C-y>', [[<C-\><C-n>:lua YankLastCommandOutput()<CR>]], { noremap = true, silent = true })
