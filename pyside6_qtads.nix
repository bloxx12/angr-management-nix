{
  cmake-build-extension,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  pyside6,
  ...
}:
buildPythonPackage rec {
  pname = "pyside6_qtads";
  version = "4.3.0.2";
  format = "pyproject";
  src = fetchFromGitHub {
    owner = "mborgerson";
    repo = "pyside6_qtads";
    rev = "refs/tags/v${version}";
    hash = "sha256-tYzGlAeGZaO/aPNRb10d/NpAIi9lbfgabiltd6rlK90=";
  };
  build-system = [
    cmake-build-extension
    setuptools
  ];
  propagatedBuildInputs = [
    pyside6
    cmake-build-extension
  ];
}
