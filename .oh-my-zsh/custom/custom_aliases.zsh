alias themis="cd /opt/intrexx/org/themis"
alias intrexx="cd /opt/intrexx/"
alias thd="cd /home/davidlosert/Projects/VDMA/vdma-themis/"
alias vdma="cd /home/davidlosert/Projects/VDMA"
alias tng="cd /home/davidlosert/Projects/VDMA/vdma-themis-ng-client"

# Aliases for service restarts
alias themis:restart="/opt/intrexx/bin/linux/upixp_themis restart"
alias themis:stop="/opt/intrexx/bin/linux/upixp_themis stop"

export INTREXX_BIN="/opt/intrexx/bin/linux"
alias themis:start:all="$INTREXX_BIN/upixsupervisor start & $INTREXX_BIN/upixtomcat start & $INTREXX_BIN/upixderby start & $INTREXX_BIN/upixp_themis start"
alias themis:start="/opt/intrexx/bin/linux/upixp_themis start"

alias themis:log="tail -n 1000 -f /opt/intrexx/org/themis/log/portal.log"
alias themis:log:wf="tail -n 1000 -f /opt/intrexx/org/themis/log/workflow.log"

alias themis:scp:log="scp admin-vdmag@10.5.8.4:/opt/intrexx70/org/themis/log/portal.log /home/davidlosert/Projects/VDMA/vdma-themis/tmp"
alias themis:scp:log:wf="scp admin-vdmag@10.5.8.4:/opt/intrexx70/org/themis/log/workflow.log /home/davidlosert/Projects/VDMA/vdma-themis/tmp"

alias dp:home="xrandr --output VGA-1 --left-of VGA-0"
alias dp:work="xrandr --output DP2-2 --right-of eDP1 && xrandr --output DP2-2 --auto && xrandr --output DP2-1 --right-of DP2-2 && xrandr --output DP2-2 --auto"

alias cp:win="sudo cp $FILE /media/sf_C_DRIVE/Users/david.losert/Downloads"

alias tngapi="cd /home/davidlosert/Projects/VDMA/vdma-themis-ng-server/api"

alias dp:home="xrandr --output eDP1 --left-of DP1 && xrandr --output DP1 --mode 2560x1440"
#alias dp:home:size="xrandr --output DP1 --mode 2560x1440"

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
