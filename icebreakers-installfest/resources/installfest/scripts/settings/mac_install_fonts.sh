#-------------------------------------------------------------------------------
# Install the cross-platform fonts (mac/os_install_fonts.sh)
#-------------------------------------------------------------------------------

# Mac OS X used to use Monaco by default in ST, but now uses Menlo.
# While Menlo works fine, it is OS X only, and is not the best choice.
# Thus we've included 3 or 4 cross-platform choices:
#
# http://www.slant.co/topics/67/~what-are-the-best-programming-fonts
# http://hivelogic.com/articles/top-10-programming-fonts
#
# 1.  Source Code Pro (OTF/TTF) — https://github.com/adobe-fonts/source-code-pro
#     Open-source and created by Adobe, this is the premier monospace
#     font. It is the preferred choice for the students (easiest to
#     read at small sizes).
# 2.  DejaVu Sans Mono (TTF) — http://dejavu-fonts.org/wiki/Main_Page
#     Open-source and created for the Linux community, this font is
#     very nice and compares well to Source Code Pro (SCP). Use on
#     Linux if SCP renders poorly.
# 3.  (Linux) Monaco (TTF) — https://github.com/cstrap/monaco-font
#     Not clear on licensing. Monaco is very similar to Menlo, and is
#     simple and clean - many students prefer it. Thus, if using
#     Menlo instead of SCP on Mac, switch Mac to Monaco and Linux to
#     Monaco in order to keep the look & feel similar.
# 4.  Inconsolata (TTF) — https://www.google.com/fonts/specimen/Inconsolata
#     Open-source and created to be similar to the MS font Consolas.
#     A great programming font included in case students are used to
#     programming with Consolas (in MS) or want another choice.
#
# The Installfest is currently using the versions:
#
# - Source Code Pro:  v2.010
# - DejaVu Sans Mono: v2.35
# - (Linux) Monaco:   ???
# - Inconsolata:      v1.014

MAC_FONTS="source-code-pro dejavu-sans-mono inconsolata"

inform "Copying preferred programming fonts..." true

for FONT_ZIP in $SCRIPT_FONTS; do
  for MAC_FONT in $MAC_FONTS; do
    if [[ $FONT_ZIP == *"$MAC_FONT"* ]]; then
      FONT_DIR="${SCRIPT_FONTS%?}$MAC_FONT"

      unzip -q "$FONT_ZIP" -d "$FONT_DIR"

      OTF_FILE_LIST=$(find "$FONT_DIR" ! -type d | grep .otf$ | grep -v .woff | grep -v "._")
      TTF_FILE_LIST=$(find "$FONT_DIR" ! -type d | grep .ttf$ | grep -v .woff | grep -v "._")

      if [ -n "$OTF_FILE_LIST" ]; then
        copy_files fonts_otf "${HOME}/Library/Fonts" "$OTF_FILE_LIST"
      else
        copy_files fonts_ttf "${HOME}/Library/Fonts" "$TTF_FILE_LIST"
      fi

      rm -rf "$FONT_DIR"
    fi
  done
done

show "Complete!"


