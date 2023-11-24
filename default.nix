{
  lib,
  stdenv,
  fetchFromGitHub,
  wrapQtAppsHook,
  qtquickcontrols2,
  qtgraphicaleffects,
  qtsvg
}:

stdenv.mkDerivation rec {
  pname = "sddm-sugar-catppuccin-macchiato";
  version = "1.0.0";

  src = ./.;

  propagatedUserEnvPkgs = [
    qtgraphicaleffects
    qtquickcontrols2
    qtsvg
  ];

  buildInputs = [ wrapQtAppsHook ];

  dontBuild = true;
  installPhase = ''
    mkdir -p $out/share/sddm/themes/sugar-catppuccin-macchiato
    cp -r * $out/share/sddm/themes/sugar-catppuccin-macchiato/
  '';

  meta = with lib; {
    description = "Catppuccin SDDM theme";
    homepage = "https://github.com/Asfhen/sddm-sugar-catppuccin-macchiato";
    license = licenses.gpl3Only;
    platforms = platforms.all;
  }; 
}
