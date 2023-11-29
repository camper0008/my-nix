{ lib, stdenvNoCC, fetchFromGitHub, gtk3, gnome-icon-theme, mint-x-icons, hicolor-icon-theme }:

stdenvNoCC.mkDerivation rec {
  version = "4.1-unstable";

  src = fetchFromGitHub {
    owner = "SylEleuth";
    repo = "gruvbox-plus-icons-pack";
    rev = "1f32isq1xyn9b6p1nx5rssqgg9gw0jp9ld19860xk29fspmlfb8n";
    sha256 = "";
  };

  nativeBuildInputs = [ gtk3 ];

  propagatedBuildInputs = [ gnome-icon-theme breeze-icons hicolor-icon-theme ];

  dontDropIconThemeCache = true;

  installPhase = ''
    mkdir -p $out/share/icons
    mv Gruvbox-Plus-Dark $out/share/icons
    gtk-update-icon-cache $out/share/icons/Gruvbox-Plus-Dark
  '';

  meta = with lib; {
    description = "Gruvbox Plus icon pack for Linux desktops based on Gruvbox color theme.";
    homepage = "https://github.com/SylEleuth/gruvbox-plus-icons-pack";
    license = licenses.mit;
    platforms = platforms.linux;
    maintainers = [ ];
  };
}
