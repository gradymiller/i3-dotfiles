#!/usr/bin/bash
#
# Install packages from a package list file
#

PKG_FILE="$HOME/dotfiles/pkglist.txt"
FAILED_FILE="$HOME/dotfiles/failed_packages.txt"

# Clear previous failed list
> "$FAILED_FILE"

if [ ! -f "$PKG_FILE" ]; then
    echo "Package list file not found: $PKG_FILE"
    exit 1
fi

# Update system first
sudo pacman -Syu --noconfirm

while read -r pkg; do
    # Skip empty lines or comments
    [[ -z "$pkg" || "$pkg" =~ ^# ]] && continue

    if pacman -Si "$pkg" &>/dev/null; then
        echo "Installing $pkg (official repo)..."
        if ! sudo pacman -S --noconfirm --needed "$pkg"; then
            echo "$pkg" >> "$FAILED_FILE"
        fi
    elif command -v yay &>/dev/null; then
        echo "Installing $pkg (AUR)..."
        if ! yay -S --noconfirm --needed "$pkg"; then
            echo "$pkg" >> "$FAILED_FILE"
        fi
    else
        echo "Package $pkg not found in official repo or AUR"
        echo "$pkg" >> "$FAILED_FILE"
    fi
done < "$PKG_FILE"

echo "All packages processed."
if [ -s "$FAILED_FILE" ]; then
    echo "Some packages failed to install. See $FAILED_FILE"
else
    echo "All packages installed successfully!"
fi
