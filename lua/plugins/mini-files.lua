function set_workdir()
  local path = MiniFiles.get_fs_entry().path
  path = string.gsub(path, "/[^/]*$", "")

  vim.fn.chdir(path)
end


return {
  "echasnovski/mini.files",
  config = function()
    local minifiles = require('mini.files')
    minifiles.setup()
    
    vim.keymap.set("n", "<Leader>t", minifiles.open)

    vim.api.nvim_create_autocmd('User', {
      pattern = 'MiniFilesBufferCreate',
      callback = function(args)
        vim.keymap.set('n', 'w', set_workdir, { buffer = args.data.buf_id })
      end,
    })

  end
}
