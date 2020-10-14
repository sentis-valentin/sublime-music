{ pkgs ? import <nixpkgs> {} }: with pkgs;
pkgs.mkShell {
  nativeBuildInputs = [
    gobject-introspection
    python3Packages.setuptools
    wrapGAppsHook
  ];

  buildInputs = [
    flatpak
    flatpak-builder
    gcc
    git
    glib
    gobjectIntrospection
    gtk3
    libnotify
    pango
    pkgconfig
  ];

  propagatedBuildInputs = with pkgs; [
    cairo
    mpv
    poetry
    python38
    rnix-lsp
  ];

  shellHook = ''
    export LD_LIBRARY_PATH=${pkgs.mpv}/lib
    export XDG_DATA_DIRS="$GSETTINGS_SCHEMA_PATH:${pkgs.arc-theme}/share:${pkgs.arc-icon-theme}/share"
    export SOURCE_DATE_EPOCH=315532800
  '';
}
