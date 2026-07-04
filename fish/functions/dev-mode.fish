#!/bin/fish


function dev-mode

	#
	# Cava
	#
	hyprctl dispatch workspace 2 &>/dev/null
	hyprctl dispatch exec -- alacritty -e 'cava' &>/dev/null
	hyprctl dispatch moveworkspacetomonitor 2 HDMI-A-1 &>/dev/null
	
	
	#
	# Music
	#
	hyprctl dispatch workspace 4 &>/dev/null
	hyprctl dispatch exec firefox-bin open.spotify.com &>/dev/null
	hyprctl dispatch moveworkspacetomonitor 4 HDMI-A-1 &>/dev/null
	sleep 2 &>/dev/null
	hyprctl dispatch workspace 2 &>/dev/null
	
	
	#
	# Communications
	#
	hyprctl dispatch exec signal-desktop &>/dev/null
	hyprctl dispatch workspace 1 &>/dev/null
	hyprctl dispatch workspace 3 &>/dev/null
	sleep 1 &>/dev/null
	
	
	#
	# Browser
	#
	hyprctl dispatch workspace 5 &>/dev/null
	hyprctl dispatch exec qutebrowser &>/dev/null
	sleep 3 &>/dev/null
	hyprctl dispatch workspace 1 &>/dev/null
	
	
	#
	# Enter development directory
	#
	cd ~/Documents/programming/
	clear && fastfetch
	# TODO: Create cli notes app to display my todos

end

