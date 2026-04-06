{ config, pkgs, ... }:
{
  systemd.services.fcitx5 = {
    enable = true;
    description = "Fcitx5 input method framework";
    wantedBy = [ "multi-user.target" ];
  };

  i18n.inputMethod.fcitx5.waylandFrontend = true;
    
  i18n.inputMethod = {
    type = "fcitx5"; 
    enable = true; 
    fcitx5.addons = with pkgs; [ 
      fcitx5-gtk # alternatively, 
      kdePackages.fcitx5-qt 
      kdePackages.fcitx5-with-addons
      qt6Packages.fcitx5-chinese-addons
      fcitx5-pinyin-moegirl
      fcitx5-pinyin-minecraft
      fcitx5-mozc
      fcitx5-nord # a color theme 
    ]; 
  };
}
