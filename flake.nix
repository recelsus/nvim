{
  description = "A flake for managing Neovim configuration";

  outputs = { self }: {
    defaultPackage.x86_64-linux = {
      initLuaPath = ./init.lua;
    };

    defaultApp = {
      configFile = ./init.lua;
    };
  };
}

