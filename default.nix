{ pkgs, lib, neovim, vimPlugins, modules ? [], ... }:
let
  lstToString = lib.lists.foldr (a: b: a + "\n" + b) "";
  moduleDefaults = { plugins = []; rc = ""; };
  getModuleRC = module: (moduleDefaults // module).rc;
  getModulePlugins = module: (moduleDefaults // module).plugins;
  modulesRC = lstToString (map getModuleRC modules);
  modulesPlugins = lib.lists.concatMap getModulePlugins modules;
in neovim.override {
  vimAlias = true;
  viAlias = true;
  configure = {
    customRC = modulesRC;
    packages.pluginPackage.start = modulesPlugins;
  };
}

