{
  buildPythonPackage,
  fetchFromGitHub,
  python3,
  pyqt5,
  pygments,
  pyqode_qt,
  future,
  ...
}:
buildPythonPackage rec {
  pname = "pyqodeng";
  version = "0.0.11";
  src = fetchFromGitHub {
    owner = "angr";
    repo = "pyqodeng";
    rev = "refs/tags/v${version}";
    hash = "sha256-QA/h5CHGrv3HYIrRaJ1Eq+iXXmQ6dYbq2zixeO9rS1c=";
  };
  propagatedBuildInputs = [
    python3
    pyqt5
    pygments
    pyqode_qt
    future
  ];
}
