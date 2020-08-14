{ pkgs, lib, fetchGit, poetry2nix, unixODBC }:
with pkgs;
poetry2nix.mkPoetryApplication rec {
  src = fetchGit (lib.importJSON ./src.json);
  projectDir = "${src}";
  overrides = poetry2nix.overrides.withDefaults (self: super: {
    mysqlclient = pkgs.mysqlclient;
    pyodbc =
      super.pyodbc.overridePythonAttrs (old: { buildInputs = [ unixODBC ]; });
  });
  meta = { license = lib.licenses.mit; };
}
