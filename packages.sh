#! /usr/bin/bash
#
# Export all current packages into a .txt file
#

OUTPUT="$HOME/dotfiles/pkglist.txt"
TMP=$(mktemp)

# Official Packages
pacman -Qqe >> "$TMP"

# AUR Packages
yay -Qqe >> "$TMP"

# Manually Built Packages
pacman -Qqm >> "$TMP"

# Remove Duplicates
sort -u "$TMP" > "$OUTPUT"
rm "$TMP"

echo "Package list exported to $OUTPUT"
