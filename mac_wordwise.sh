#!/bin/bash
mkdir -p ~/.xkb/{keymap,symbols,types}
cp ./.xkb/symbols/mac_levels ~/.xkb/symbols/mac_levels
cp ./.xkb/types/mac_levels ~/.xkb/types/mac_levels
setxkbmap -option
setxkbmap -print > ~/.xkb/keymap/kbd.mac.gui
line=$(cat ~/.xkb/keymap/kbd.mac.gui | grep -n 'xkb_symbols' | cut -f1 -d:)
sed -ie "${line}s/)\"/)+altwin(ctrl_alt_win)+mac_levels(mac_levelssym)\"/g" ~/.xkb/keymap/kbd.mac.gui