 #!/bin/tclsh

 # load libaries
 load tclrega.so

# include config
source config.tcl

# Variablen:
# Roomba-Batterie       Zahl


set url http://$ip/rwr.xml
exec /usr/bin/wget -q -O /usr/local/addons/homematicRoomba/Roomba.xml $url

set f [open "/usr/local/addons/homematicRoomba/Roomba.xml"]
set input [read $f]
close $f

regexp "<response>(.*?)</response>" $input dummy current  ; #get current state
regexp "<r18>(.*?)</r18>" $current dummy charge  ; #get charge
regexp "<r19>(.*?)</r19>" $current dummy capacity  ; #get capacity
set battery [expr {($charge * 100) / $capacity}];

# set ReGaHss variables
set rega_cmd ""
append rega_cmd "dom.GetObject('Roomba-Batterie').State('$battery');"
rega_script $rega_cmd