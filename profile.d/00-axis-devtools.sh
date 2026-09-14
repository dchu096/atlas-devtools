# Shown on interactive DevTools login (PTY / SSH). Skip scripts and pipes.
case $- in
*i*) ;;
*) return 0 ;;
esac

[ -t 1 ] || return 0

alias motd='cat /etc/motd'

if command -v fastfetch >/dev/null 2>&1; then
	# Keep cache/config off the game data volume (HOME is /home/container).
	XDG_CACHE_HOME=/tmp XDG_CONFIG_HOME=/etc fastfetch
	printf '\n'
fi

[ -r /etc/motd ] && cat /etc/motd
