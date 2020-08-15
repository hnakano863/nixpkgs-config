self: super: {
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
    let kernel = super.jupyter-kernel.create { definitions = kernelSpec; };
    in super.mkShell {
      buildInputs = [ kernel ];
      JUPYTER_PATH = "${kernel.out}";
    };

}
