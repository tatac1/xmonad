#!/bin/sh

PATH=~/.bin:~/.xmonad/bin:~/.cabal/bin:$PATH
/usr/lib/systemd/systemd --user &

# Configure X
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap
xscreensaver -no-splash &
#feh --bg-fill -z ~/Pictures/Wallpapers
# set the cursor
xsetroot -cursor_name left_ptr
# set Japanese keyboard layout
setxkbmap -layout jp
# language setting
#export LANG=ja_JP.UTF-8

# Start a D-Bus session
if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi
# Start a D-Bus session

# Start GNOME Keyring
eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
# You probably need to do this too:
export SSH_AUTH_SOCK
export GPG_AGENT_INFO
export GNOME_KEYRING_CONTROL
export GNOME_KEYRING_PID

# Daily apps
nm-applet &
parcellite &
feh --bg-scale $HOME/Photos/snev7Ga.png
#firefox &

# pacman -S fcitx-mozc fcitx-gtk2 fcitx-gtk3 fcitx-configtool
# Input method
export DefaultIMModule=fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
fcitx -d
#export GTK_IM_MODULE=ibus
#export XMODIFIERS='@im=uim'
#export QT_IM_MODULE=ibus
#ibus-daemon -drx

#export XMODIFIERS=@im=xim
#export GTK_IM_MODULE=xim #Fix for Chrome
#export QT_IM_MODULE=xim
#ibus-daemon --xim&

exec dbus-launch --sh-syntax --exit-with-session xmonad
