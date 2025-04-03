function configure_lsp()
  local lsp = require("lspconfig")
  local cap = require("blink.cmp").get_lsp_capabilities()

  -- Big Languages
  lsp.clangd.setup{capabilities=cap} -- C/CPP -- https://clangd.llvm.org/installation.html
  lsp.java_language_server.setup{capabilities=cap} -- Java -- https://github.com/georgewfraser/java-language-server
  lsp.matlab_ls.setup{capabilities=cap} -- Matlab o_O -- https://github.com/mathworks/MATLAB-language-server
  lsp.pylsp.setup{capabilities=cap} -- https://github.com/python-lsp/python-lsp-server
  lsp.rust_analyzer.setup{capabilities=cap} -- https://github.com/rust-lang/rust-analyzer


  -- Build Tools
  lsp.cmake.setup{capabilities=cap} -- https://github.com/regen100/cmake-language-server
  lsp.autotools_ls.setup{capabilities=cap} -- Makefile LSP -- pip install autotools-language-server


  -- IAC / Containers
  lsp.dockerls.setup{capabilities=cap} -- https://github.com/rcjsuen/dockerfile-language-server-nodejs
  lsp.docker_compose_language_service.setup{capabilities=cap} -- https://github.com/microsoft/compose-language-service
  lsp.helm_ls.setup{} -- https://github.com/mrjosh/helm-ls
  
  lsp.terraform_lsp.setup{capabilities=cap} -- https://github.com/juliosueiras/terraform-lsp


  -- Markup
  -- https://github.com/redhat-developer/yaml-language-server
  -- Modeline to specify Schema
  -- # yaml-language-server: $schema=<urlToTheSchema|relativeFilePath|absoluteFilePath}>
  lsp.yamlls.setup {
    capabilities=cap,
    settings = {
      yaml = {
        schemaStore = {
          enable = true
        }
      }
    }
  }

  lsp.jsonls.setup{capabilities=cap} -- https://github.com/hrsh7th/vscode-langservers-extracted


  -- Notetaking / Documentation
  lsp.texlab.setup{capabilities=cap} -- https://github.com/latex-lsp/texlab
  lsp.markdown_oxide.setup{capabilities=cap} -- https://github.com/Feel-ix-343/markdown-oxide


  -- Misc
  lsp.systemd_ls.setup{capabilities=cap} -- https://github.com/psacawa/systemd-language-server
  lsp.ansiblels.setup{capabilities=cap} -- Ansible -- https://github.com/ansible/vscode-ansible
  lsp.nginx_language_server.setup{capabilities=cap} -- Nginx -- https://pypi.org/project/nginx-language-server/


end

return {
  "neovim/nvim-lspconfig",
  dependencies = { "saghen/blink.cmp" },
  config = configure_lsp
}
