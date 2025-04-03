return {
  "amitds1997/remote-nvim.nvim",
  dependencies = { "MunifTanjim/nui.nvim" },
  config = function()
    require("remote-nvim").setup {}
    require("telescope").load_extension("remote-nvim")
  end
}
