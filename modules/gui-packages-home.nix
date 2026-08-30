{ pkgs, ... }:
{
  home.stateVersion = "26.05";
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    ungoogled-chromium
    rustup
    jdk25
    prismlauncher
    gcc
    godot
    tree
    zed-editor
    wl-clipboard
    steam
    yubikey-manager
    yubikey-personalization
    keepassxc
    nil
    owmods-gui
  ];
}
