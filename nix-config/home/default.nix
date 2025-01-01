{pkgs, username, ...}: {
  imports = [
  ];

  home = {
    username = username;
    homeDirectory = "/Users/${username}";

    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    stateVersion = "25.05";
  };

  home.packages = with pkgs; [
    # program languages
    clojure
    go
    nodejs
    python3
    typescript

    # (if pkgs.stdenv.isDarwin then zulu8 else jdk8)
    # jdk8
    # jdk11
    # zulu11
    # jdk17
    # jdk21
    # jdk23

    # lsp servers
    emacs-lsp-booster
    nixd
    alejandra # nix formatter
    lua-language-server
    pyright
    ruff # python linter
    black # python formatter
    typescript-language-server
    vscode-langservers-extracted # HTML/CSS/JSON/ESLint language servers
    jdt-language-server
    clojure-lsp
    gopls

    # devtools
    wget
    jq
    act
    buildpack
    kubernetes-helm
    k3d
    k9s
    kubectl
    lazydocker
    maven
    pnpm
    pdm
    mkcert
    termshark
    iredis
    mise # manage jdks
    aider-chat

    # others
    # firefox-devedition
    google-chrome
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
