local plugins = {}

table.insert(plugins, {
  "echasnovski/mini.files",
  config = function()
    require('mini.files').setup()
  end
})

return plugins
