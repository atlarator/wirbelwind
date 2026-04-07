{ config, pkgs, inputs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # distro maintaining tools
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
    git
    gnupg
    gtop
    hyfetch
    i2p
    just
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
    # Rust utils
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
    # packages from flake
    inputs.helix.packages."${pkgs.stdenv.hostPlatform.system}".helix
  ]
  ++ [
    # desktop applications
    element-desktop
    flclash
    ghostty
    google-chrome
    libreoffice
    localsend
    motrix
    obsidian
    obs-studio
    osu-lazer-bin
    telegram-desktop
    thunderbird
    steam
    vscode
    vlc
  ];
}
