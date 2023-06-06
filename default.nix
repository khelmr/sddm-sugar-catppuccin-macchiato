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
  pname = "sddm-sugar-catppuccin";
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
    mkdir -p $out/share/sddm/themes/sugar-catppuccin
    cp -r * $out/share/sddm/themes/sugar-catppuccin/
  '';

  meta = with lib; {
    description = "Catppuccin SDDM theme";
    homepage = "https://github.com/TiagoDamascena/sddm-sugar-catppuccin";
    license = licenses.gpl3Only;
    platforms = platforms.all;
  }; 
}
