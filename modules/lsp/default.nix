{ vimPlugins, wrapLua, ... }:
{
  plugins = [ vimPlugins.nvim-lspconfig ];
  rc = wrapLua ./lsp.lua;
}
