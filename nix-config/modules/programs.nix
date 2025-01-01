{pkgs, ...}: {
  # Install packages from nix's official package repository.
  #
  # The packages installed here are available to all users, and are reproducible across machines, and are rollbackable.
  # But on macOS, it's less stable than homebrew.
  #
  # Related Discussion: https://discourse.nixos.org/t/darwin-again/29331
  environment.systemPackages = with pkgs; [
    vim
    git
  ];
  environment.variables.EDITOR = "vim";

  # Create /etc/zshrc that loads the nix-darwin environment.
  # this is required if you want to use darwin's default shell - zsh
  programs.zsh.enable = true;
  environment.shells = [
    pkgs.zsh
  ];

  # NOTE: To make this work, homebrew need to be installed manually, see https://brew.sh
  #
  # The apps installed by homebrew are not managed by nix, and not reproducible!
  # But on macOS, homebrew has a much larger selection of apps than nixpkgs, especially for GUI apps!
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = true; # Fetch the newest stable branch of Homebrew's git repo
      upgrade = true; # Upgrade outdated casks, formulae, and App Store apps
      # 'zap': uninstalls all formulae(and related files) not listed in the generated Brewfile
      # cleanup = "zap";
    };

    # Applications to install from Mac App Store using mas.
    # You need to install all these Apps manually first so that your apple account have records for them.
    # otherwise Apple Store will refuse to install them.
    # For details, see https://github.com/mas-cli/mas
    masApps = {
      WPS = 1443749478;
      Wechat = 836500024;
      WeCom = 1189898970;  # Wechat for Work
      TecentMetting = 1484048379;
      BaiduNetDisk = 547166701;
      # Xcode = 497799835;
      # NeteaseCloudMusic = 944848654;
      # QQ = 451108668;
      # QQMusic = 595615424;
    };

    taps = [
      # "homebrew/services"
      "d12frosted/emacs-plus"
    ];

    # `brew install`
    brews = [
      "curl" # no not install curl via nixpkgs, it's not working well on macOS!
      "coreutils"
      "poppler"
      # TODO: https://emacs-china.org/t/nixos-emacs/28181/9
      "libvterm"
    ];

    # `brew install --cask`
    casks = [
      # dev tools
      "lm-studio"
      "raycast"
      "wezterm"
      "orbstack"
      "wireshark"
      "visual-studio-code"

      # others
      "karabiner-elements"
      "scroll-reverser"
      "firefox@developer-edition"
      "telegram"
      "clash-verge-rev"
    ];
  };
}
