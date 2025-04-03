function config_telescope()
    require("telescope").setup{
      extensions = {
        fzf = {
          fuzzy = true,                    -- false will only do exact matching
          override_generic_sorter = true,  -- override the generic sorter
          override_file_sorter = true,     -- override the file sorter
          case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                           -- the default case_mode is "smart_case"
        }
      }
    }

    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
end

return {
  "nvim-telescope/telescope.nvim",
  dependencies = { 
    "nvim-telescope/telescope-fzf-native.nvim",
    build = make_command,
    config = function()
      if vim.loop.os_uname().sysname == "Linux" then
        require("telescope").load_extension("fzf")
      end
    end
  },
  config = config_telescope
}
