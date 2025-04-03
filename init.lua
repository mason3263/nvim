function require_dir(dir)
  local nvim_conf = vim.fn.stdpath("config")
  
  if vim.loop.os_uname().sysname == "Linux" then
    for file in io.popen("find \""..nvim_conf.."/lua/"..dir.. "\" | grep .lua$"):lines() do
      file = string.gsub(file, ".*config/nvim/lua/", "")
      file = string.gsub(file, "/", ".")
      file = string.sub(file, 0, -5)
      require(file)
    end
  else
    for file in io.popen("dir /B "..nvim_conf.."\\lua\\"..dir):lines() do
      file = string.sub(file, 0, -5)
      require(dir.."."..file)
    end
  end
end

-- require("config.lazy")
-- require("config.settings")

require_dir("config")

if vim.loop.os_uname().sysname == "Linux" then
  vim.g.terminal_emulator='bash'
else
  vim.g.terminal_emulator='powershell'
end
