{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    cmake
    gcc
    pkg-config
    SDL2
    SDL2_image
    libwebp
    libtiff
    libpng
    libjpeg
  ];
}
