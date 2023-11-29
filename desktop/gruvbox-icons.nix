{ lib, stdenvNoCC, fetchFromGitHub, gtk3, gnome-icon-theme, breeze-icons, hicolor-icon-theme }:

stdenvNoCC.mkDerivation rec {
  name = "gruvbox-plus-icon";
  version = "4.1-unstable";

  src = fetchFromGitHub {
    owner = "SylEleuth";
    repo = "gruvbox-plus-icon-pack";
    rev = "3f995a4be40eca7836cc4cb18cea10559fafcc4d";
    sha256 = "sha256-Z9sHnnz3piAWEyUjXbyEGLsDN4GGGcKVCcugnZa1YNo=";
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
