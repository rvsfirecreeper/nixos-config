# nix-ld so prebuilt binaries can find common shared libraries.
{ ... }:
{
  flake.modules.nixos.linker-fixes =
    { pkgs, ... }:
    {
      programs.nix-ld = {
        enable = true;

        libraries = with pkgs; [
          zlib
          openssl
          curl
          stdenv.cc.cc
          glib
        ];
      };
    };
}
