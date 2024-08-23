{
  buildPythonPackage,
  fetchFromGitHub,
  ...
}:
# with import <nixpkgs> {};
# inherit (pkgs.python3Packages) buildPythonPackage;
# inherit (pkgs) fetchFromGitHub;
buildPythonPackage rec {
  pname = "libbs";
  version = "1.18.4";
  src = fetchFromGitHub {
    owner = "binsync";
    repo = "libbs";
    rev = "refs/tags/v${version}";
    hash = "sha256-H+r7W/A1ry7AfhQEW4OFbCpAX9F/XZFMK8TDbkz6iog=";
  };
}
