{
  allowBroken = false;
  allowUnfree = false;
  allowUnsupportedSystem = false;
  allowInsecure = false;
  packageOverrides = pkgs:
    with pkgs; rec {
      defaultKernelSpec = { python3 }: {
        python3 = {
          displayName = "Python 3";
          argv = [
            python3.interpreter
            "-m"
            "ipykernel_launcher"
            "-f"
            "{connection_file}"
          ];
          language = "python";
          logo32 = "${python3.sitePackages}/ipykernel/resources/logo-32x32.png";
          logo64 = "${python3.sitePackages}/ipykernel/resources/logo-64x64.png";
        };
      };

      jupyterEnv = kernelSpec:
        let kernel = jupyter-kernel.create { definitions = kernelSpec; };
        in pkgs.mkShell {
          buildInputs = [ kernel ];
          JUPYTER_PATH = "${kernel.out}";
        };

      python3 = import ./python3/default.nix { inherit pkgs; };
    };
}
