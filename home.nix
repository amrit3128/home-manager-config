{ config, pkgs, ... }:

let
  unstable = import <nixos-unstable> {};
in

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "amrit";
  home.homeDirectory = "/home/amrit";
  home.file.".zshrc".source = ~/dotfiles/.zshrc;
  home.file.".zshenv".source = ~/dotfiles/.zshenv;

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    pkgs.telegram-desktop
    pkgs.swaynotificationcenter
    pkgs.gopls
    pkgs.nixd
    pkgs.nil
    pkgs.gomodifytags
    pkgs.gotests
    pkgs.nixfmt-rfc-style
    pkgs.mpv
    pkgs.wofi
    pkgs.mpvScripts.mpris
    pkgs.mu
    pkgs.shellcheck
    pkgs.html-tidy
    pkgs.stylelint
    pkgs.git
    pkgs.helix
    pkgs.gore
    pkgs.zsh
    unstable.zig_0_12
    unstable.rustup
    pkgs.gdu
    pkgs.gh
    pkgs.dunst
    pkgs.pavucontrol
    pkgs.pywal
    pkgs.wallust
    pkgs.lazygit
    pkgs.wlogout
    pkgs.feh
    pkgs.python312Packages.pytest
    unstable.python312Packages.nose
    unstable.neovim
    pkgs.neovide
    pkgs.yazi
    pkgs.zoxide
    pkgs.zathura
    pkgs.pipenv
    pkgs.isort
    pkgs.sbcl
    pkgs.haskellPackages.haskell-language-server
    pkgs.pandoc
    pkgs.nodePackages_latest.js-beautify
    pkgs.fzf
    pkgs.haskellPackages.hoogle
    pkgs.haskellPackages.lsp
    pkgs.haskellPackages.cabal-install
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];


# Home Manager is pretty good at managing dotfiles. The primary way to manage
# plain files is through 'home.file'.
home.file = {
  # # Building this configuration will create a copy of 'dotfiles/screenrc' in
  # # the Nix store. Activating the configuration will then make '~/.screenrc' a
  # # symlink to the Nix store copy.
  # ".screenrc".source = dotfiles/screenrc;

  # # You can also set the file content immediately.
  # ".gradle/gradle.properties".text = ''
  #   org.gradle.console=verbose
  #   org.gradle.daemon.idletimeout=3600000
  # '';
};

  # programs.zsh = {
  #   enable = true;
  #   enableCompletion = true;
  #   autosuggestion.enable = true;
  #   syntaxHighlighting.enable = true;
  #
  #   initExtra = ''
  #     [[ ! -f ${~/.p10k.zsh} ]] || source ${~/dotfiles/.p10k.zsh}
  #   '';
  #
  #   shellAliases = {
  #     ll = "ls -l";
  #     update = "sudo nixos-rebuild switch";
  #   };
  #
  #   history = {
  #     size = 100000;
  #     path = "${config.xdg.dataHome}/zsh/history";
  #   };
  #
  #   zplug = {
  #     enable = true;
  #     plugins = [
  #       { name = "zsh-users/zsh-autosuggestions"; } # Simple plugin installation
  #       { name = "romkatv/powerlevel10k"; tags = [ as:theme depth:1 ]; } # Installations with additional options. For the list of options, please refer to Zplug README.
  #     ];
  #   };
  #
  # };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/amrit/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
    LOCALE_ARCHIVE="$(nix-env --installed --no-name --out-path --query glibc-locales)/lib/locale/locale-archive";
    LANG = "en_US.UTF-8";
    LC_ALL = "en_US.UTF-8";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
