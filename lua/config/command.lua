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

