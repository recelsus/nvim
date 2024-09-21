local function is_fcitx5_installed()
  local handle = io.popen("command -v fcitx5")
  local result = handle:read("*a")
  handle:close()
  return result ~= ""
end

return (function()
  if vim.loop.os_uname().sysname == "Linux" then
    if not is_fcitx5_installed() then
      return {}
    else
      return {
        {
          "keaising/im-select.nvim",
          config = function()
            require("im_select").setup({
              default_im_select = "1",
              set_default_events = {"VimEnter", "InsertEnter", "InsertLeave"},
              set_previous_events = {},
            })
          end,
        }
      }
    end
  else
    return {
      {
        "keaising/im-select.nvim",
        config = function()
          require("im_select").setup({
            default_im_select = "com.apple.keylayout.US",
            set_default_events = {"VimEnter", "InsertEnter", "InsertLeave"},
            set_previous_events = {},
          })
        end,
      }
    }
  end
end)()

