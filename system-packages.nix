{ config, pkgs, inputs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    arch-install-scripts
    apt
    bird2
    btop
    caddy
    ciel
    claude-code
    debian-devscripts
    debootstrap
    docker
    fastfetch
    fish
    flclash
    git
    gnupg
    gtop
    hyfetch
    i2p
    kitty
    kubectl
    pacman
    pi-coding-agent
    wireguard-tools
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    virtualbox
    wget
    tmux
  ]
  ++ [
    ntpd-rs
    sudo-rs
    uutils-acl
    uutils-coreutils-noprefix
    uutils-diffutils
    uutils-findutils
    uutils-hostname
    uutils-login
    uutils-procps
    uutils-sed
    uutils-tar
    uutils-util-linux
  ]
  ++ [
    inputs.helix.packages."${pkgs.stdenv.hostPlatform.system}".helix
  ];
}
