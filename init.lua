vim.g.mapleader = ' '

require('config.config')
require('config.command')

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local function load_plugins()
  local env_path = vim.fn.stdpath("config") .. "/env"
  local file = io.open(env_path, "r")
  local env = file and file:read("*l") or "full"
  if file then file:close() end

  local plugin_dir = vim.fn.stdpath("config") .. "/lua/plugins"
  local plugins = {}

  local minimal_excludes = {
    ["codecompanion.lua"] = true,
    ["markdown-preview.lua"] = true,
    ["nvim-lsp.lua"] = true,
    ["telescope.lua"] = true,
    ["which-key.lua"] = true,
    ["copilot.lua"] = true,
  }

  for _, fname in ipairs(vim.fn.readdir(plugin_dir)) do
    if fname:match("%.lua$") then
      if env == "minimal" and minimal_excludes[file] then
        goto continue
      end

      local module_name = fname
        :gsub("%.lua$", "")
        :gsub("%.", "_")

      local ok, mod = pcall(require, "plugins." .. module_name)
      if ok then
        table.insert(plugins, mod)
      else
        vim.notify("Failed to load plugin: " .. file, vim.log.levels.WARN)
      end
    end
    ::continue::
  end

  return plugins
end

require("lazy").setup(load_plugins(), {
  rocks = { enabled = false },
})

