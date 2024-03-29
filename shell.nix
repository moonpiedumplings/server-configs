{
  # pkgs ? import (fetchTarball https://github.com/NixOS/nixpkgs/archive/nixpkgs-unstable.tar.gz) {}
  pkgs ? import <nixpkgs> {}
}:

let
  my-python-packages = ps: with ps; [
    ansible
    ansible-core
    molecule
    molecule-plugins
    # other python packages
  ];
in
with pkgs;
mkShell {
  LC_ALL = "C.UTF-8";
  LANG = "C.UTF-8";
  ANSIBLE_HOST_KEY_CHECKING = "False";
  buildInputs = [
    # vagrant maybe for testing later
    openssh
    sshpass
    sshs
    (pkgs.python311.withPackages my-python-packages)
    ansible-lint
  ];
}
