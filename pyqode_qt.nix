{
  buildPythonPackage,
  fetchFromGitHub,
  pyqt5,
  ...
}:
# with import <nixpkgs> {};
# inherit (pkgs.python3Packages) buildPythonPackage;
# inherit (pkgs) fetchFromGitHub;
buildPythonPackage rec {
  pname = "pyqode.qt";
  version = "2.8.0";
  src = fetchFromGitHub {
    owner = "pyQode";
    repo = "pyqode.qt";
    rev = "refs/tags/${version}";
    hash = "sha256-H+r7W/A1ry7AfhQEW4OFbCpAX9F/XZFMK8TDbkz6iog=";
  };
  propagatedBuildInputs = [pyqt5];
}
