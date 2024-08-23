{
  callPackage,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  filelock,
  gitpython,
  prompt-toolkit,
  pycparser,
  sortedcontainers,
  toml,
  tqdm,
  ...
}:
buildPythonPackage rec {
  pname = "binsync";
  version = "4.0.0";
  format = "pyproject";
  src = fetchFromGitHub {
    owner = "binsync";
    repo = "binsync";
    rev = "refs/tags/v${version}";
    hash = "sha256-lDH+PjFBG17V4mv4dydAJl2Z1qfLTD9yGPzWThUZ0nM=";
  };
  build-system = [
    setuptools
  ];
  propagatedBuildInputs = [
    (callPackage ./libbs.nix {inherit buildPythonPackage fetchFromGitHub;})
    filelock
    gitpython
    prompt-toolkit
    pycparser
    sortedcontainers
    toml
    tqdm
  ];
}
