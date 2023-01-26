{
  description = "Can's neovim config with plugins";
  inputs.flake-utils.url = "github:numtide/flake-utils";
  outputs = { self, flake-utils, nixpkgs }: flake-utils.lib.eachDefaultSystem (system:
  let
    pkgs = import nixpkgs { inherit system; };
    modules = pkgs.callPackage ./modules {};
  in {
    defaultPackage = pkgs.callPackage ./default.nix {
      inherit modules;
    };
  }
  );
}

