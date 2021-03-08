alias dp:home="xrandr --output VGA-1 --left-of VGA-0"
alias dp:work="xrandr --output DP2-2 --right-of eDP1 && xrandr --output DP2-2 --auto && xrandr --output DP2-1 --right-of DP2-2 && xrandr --output DP2-2 --auto"

alias dp:home="xrandr --output eDP1 --left-of DP1 && xrandr --output DP1 --mode 2560x1440"

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias au='sudo apt-get update -y'
alias aug='sudo apt-get upgrade -y'
alias o='xdg-open'
