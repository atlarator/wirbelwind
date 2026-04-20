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
    bat
    bird2
    btop
    caddy
    ciel
    debian-devscripts
    debootstrap
    distrobox
    duf
    fastfetch
    fd
    fwupd
    fish
    git
    gnupg
    gtop
    hyfetch
    ioztat
    just
    kubectl
    mesa
    minikube
    nixpkgs-vet
    nvtopPackages.full
    ollama
    opencode
    pacman
    podman
    pi-coding-agent
    restic
    wireguard-tools
    vim
    wget
    television
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
    inputs.attic.packages."${pkgs.stdenv.hostPlatform.system}".default
    inputs.bento.packages."${pkgs.stdenv.hostPlatform.system}".default
    inputs.helix.packages."${pkgs.stdenv.hostPlatform.system}".default
    inputs.nix-search-tv.packages.x86_64-linux.default
  ]
  ++ [
    # desktop applications
    element-desktop
    flclash
    ghostty
    google-chrome
    kopia-ui
    libreoffice
    localsend
    motrix
    obsidian
    obs-studio
    osu-lazer-bin
    telegram-desktop
    thunderbird
    tor-browser
    steam
    vscode
    vlc
  ];
}
