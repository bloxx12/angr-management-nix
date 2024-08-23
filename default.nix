with import <nixpkgs> {}; let
  inherit (pkgs.python3Packages) buildPythonPackage callPackage;
  inherit (pkgs.python3Packages) filelock future gitpython prompt-toolkit pycparser pygments sortedcontainers toml tqdm pyqt5 pyside6;
  inherit (pkgs.python3Packages) setuptools;

  inherit (pkgs) fetchFromGitHub python3;

  binsync = callPackage ./binsync.nix {
    inherit callPackage buildPythonPackage fetchFromGitHub;
    inherit setuptools;
    inherit filelock gitpython prompt-toolkit pycparser;
    inherit sortedcontainers toml tqdm;
  };

  cmake-build-extension = callPackage ./cmake-build-extension.nix {
    inherit buildPythonPackage fetchFromGitHub;
  };

  pyqode_qt = callPackage ./pyqode_qt.nix {
    inherit buildPythonPackage fetchFromGitHub pyqt5;
  };

  pyqodeng = callPackage ./pyqodeng.nix {
    inherit buildPythonPackage fetchFromGitHub;
    inherit python3 pyqt5 pygments future;
    inherit pyqode_qt;
  };
  pyside6_qtads = callPackage ./pyside6_qtads.nix {
    inherit buildPythonPackage fetchFromGitHub;
    inherit setuptools cmake-build-extension;
    inherit pyside6;
  };

  angr-management = buildPythonPackage rec {
    pname = "angr-management";
    version = "9.2.115";
    format = "pyproject";
    src = fetchFromGitHub {
      owner = "angr";
      repo = "angr-management";
      rev = "refs/tags/v${version}";
      hash = "sha256-6KO9moD7ehThDzx8KAtq34VSYNknMs3K+Rwo3iY4NLc=";
    };
    propagatedBuildInputs = with pkgs.python3Packages; [
      angr
      bidict
      binsync
      ipykernel
      ipython
      jupyter-core
      jupyter-client
      pyqodeng
      pyside6
      pyside6_qtads
      pyzmq
      qtawesome
      qtpy
      requests
      thefuzz
      tomlkit
      traitlets
    ];
  };
in {
  inherit angr-management;
}
