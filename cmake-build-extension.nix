{
  buildPythonPackage,
  fetchFromGitHub,
  ...
}:
# with import <nixpkgs> {};
# inherit (pkgs.python3Packages) buildPythonPackage;
# inherit (pkgs) fetchFromGitHub;
buildPythonPackage rec {
  pname = "cmake-build-extension";
  version = "0.6.0";
  src = fetchFromGitHub {
    owner = "diegoferigo";
    repo = "cmake-build-extension";
    rev = "refs/tags/v${version}";
    hash = "sha256-m7le7MhdKv9w/cV8h9BAcRV+glsGq9ctsNezNmFjFgA=";
  };
}
