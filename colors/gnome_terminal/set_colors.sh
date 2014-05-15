#!/bin/bash 

# Save this script into set_colors.sh, make this file executable and run it: 
# 
# $ chmod +x set_colors.sh 
# $ ./set_colors.sh 
# 
# Alternatively copy lines below directly into your shell. 

gconftool-2 --set /apps/gnome-terminal/profiles/Default/use_theme_background --type bool false 
gconftool-2 --set /apps/gnome-terminal/profiles/Default/use_theme_colors --type bool false 
gconftool-2 -s -t string /apps/gnome-terminal/profiles/Default/background_color '#0d0d19192626'
gconftool-2 -s -t string /apps/gnome-terminal/profiles/Default/foreground_color '#d9d9e6e6f2f2'
gconftool-2 -s -t string /apps/gnome-terminal/profiles/Default/palette '#000000000000:#c5c540404444:#4444c5c54040:#c5c5c1c14040:#40404444c5c5:#c1c14040c5c5:#4040c5c5c1c1:#d9d9d9d9d9d9:#262626262626:#dbdb89898c8c:#8c8cdbdb8989:#dbdbd9d98989:#89898c8cdbdb:#d9d98989dbdb:#8989dbdbd9d9:#ffffffffffff'