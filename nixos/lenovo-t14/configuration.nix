# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

 let
  locker = "${pkgs.betterlockscreen}/bin/betterlockscreen --lock";
 in

{
  imports =
    [
    # sudo nix-channel --add https://github.com/NixOS/nixos-hardware/archive/master.tar.gz nixos-hardware
    # sudo nix-channel --update
      <nixos-hardware/lenovo/thinkpad/t14/amd/gen1>
    # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.efiSupport = true;
  boot.loader.systemd-boot.enable = false;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.luks.devices.luksroot =
   {
     device = "/dev/disk/by-uuid/8f691918-60f2-4610-8f42-58e3e590332b";
     preLVM = true;
     allowDiscards = true;
   };
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Set your time zone.
  # time.timeZone = "Asia/Yerevan"
  # "Asia/Novosibirsk";

  networking.hostName = "leothink"; # Define your hostname.
  # networking.wireless.enable = true;
  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.networkmanager.enable = true;


  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  # };

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    # Configure keymap in X11
    layout = "us,ru";
    xkbOptions = "grp:ctrl_shift_toggle";

    windowManager = {
      xmonad = {
        enable = true;
     };
    };

    displayManager = {
      defaultSession = "none+xmonad";
      autoLogin = {
        enable = true;
        user = "leo";
      };
    };

    desktopManager = {
        xterm.enable = false;
    };
  };

  programs.xss-lock = {
    enable = true;
    lockerCommand = locker;
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio = {
    enable = true;
    extraConfig = ''
    '';
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;

  # Diaplay light control
  programs.light.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.leo = {
    isNormalUser = true;
    home = "/home/leo";
    extraGroups = [ "wheel" "networkmanager" "video" "lp"]; # Enable ‘sudo’ for the user.
  };

  services.logind.extraConfig = ''
    HandlePowerKey=suspend
    HandleLidSwitch=suspend
  '';

  services.ntp.enable = true;

  services.blueman.enable = true;

  # Forces a reset for specified bluetooth usb dongle.
  systemd.services.fix-generic-usb-bluetooth-dongle = {
    description = "Fixes for generic USB bluetooth dongle.";
    wantedBy = [ "post-resume.target" ];
    after = [ "post-resume.target" ];
    script = builtins.readFile ./scripts/hack.usb.reset;
    scriptArgs = "8087:0a2b";
    serviceConfig.Type = "oneshot";
  };

  systemd.user.services.lockscreen = {
    enable = true;
    before = [ "sleep.target" "suspend.target" "hibernate.target" ];
    wantedBy = [ "sleep.target" "suspend.target" "hibernate.target" ];
    description = "lock with suspend/sleep";
    serviceConfig = {
      Type = "forking";
      ExecStartPost = "${pkgs.coreutils}/bin/sleep 1";
      TimeoutSec="infinity";
    };
    script = locker;
  };

  systemd.user.services.xmonitor-toggle = {
    description = "Auto-connection monitor";
    wantedBy = [ "graphical-session.target" ];
    partOf = [ "graphical-session.target" ];
    path = config.environment.systemPackages;
    serviceConfig = {
       RestartSec = 5;
       Restart = "always";
     };
    script = builtins.readFile ./scripts/xmonitor-toggle;
   };

  systemd.user.services.udiskie = {
    description = "Automout usb";
    wantedBy = [ "graphical-session.target" ];
    partOf = [ "graphical-session.target" ];
    serviceConfig = {
       Type = "simple";
       ExecStart = "${pkgs.udiskie}/bin/udiskie";
       TimeoutSec="infinity";
     };
   };

  systemd.user.services.stalonetray = {
    description = "Stand alone tray";
    wantedBy = [ "graphical-session.target" ];
    partOf = [ "graphical-session.target" ];
    serviceConfig = {
       ExecStart = "${pkgs.stalonetray}/bin/stalonetray --dockapp-mode simple -bg \"#333333\" --sticky --geometry 5x1+1820+0 --icon-size 20";
       TimeoutSec="infinity";
     };
   };

  systemd.user.services.picom = {
    description = "Composite manager";
    wantedBy = [ "graphical-session.target" ];
    partOf = [ "graphical-session.target" ];
    serviceConfig = {
       ExecStart = "${pkgs.picom}/bin/picom";
       TimeoutSec="infinity";
     };
   };

  nixpkgs.config.allowUnfree = true;
  environment.sessionVariables = {
    DISPLAY = ":0";
    XDG_CACHE_HOME  = "\${HOME}/.cache";
    XDG_CONFIG_HOME = "\${HOME}/.config";
    XDG_BIN_HOME    = "\${HOME}/.local/bin";
    XDG_DATA_HOME   = "\${HOME}/.local/share";
    USER_BIN = "\${HOME}/bin";

    PATH = [
      "\${XDG_BIN_HOME}"
       "\${USER_BIN}"
   ];
  };
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
     killall
     htop
     nano
     git
     curl
     wget
     firefox
     google-chrome
     thunderbird
     discord
     ruby
     nodejs
     networkmanager-openvpn
     kitty
     picom
     polybarFull
     rofi
     pavucontrol
     udiskie
     dunst
     autorandr
     silver-searcher
     ripgrep
     okular
     feh
     flameshot
     betterlockscreen
     rdesktop
     scala
     openjdk11
     sbt
     stack
     haskell-language-server
     xmobar
     pulsemixer
     stalonetray
     dmenu
   ];

   fonts.fonts = with pkgs; [
     jetbrains-mono
     inconsolata-lgc
     nerdfonts
     lato
     font-awesome
   ];

   programs = {
     # https://github.com/nix-community/home-manager/blob/master/modules/programs/neovim.nix
     neovim = {
       enable = true;
       viAlias = true;
       vimAlias = true;
      };
    };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };


  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.11"; # Did you read the comment?

}

