#!/bin/tclsh

load tclrega.so;

# incluce system variable mapping
source conf/config.tcl

# Variablen:
# Roomba-Batterie       Zahl

set url http://$ip/rwr.xml
if { [catch {exec /usr/bin/wget -q -O Roomba.xml $url} error] } {
    puts stderr "Could not reach Roomba from $url \n$error"
    exit 1
}

set f [open "Roomba.xml"]
set input [read $f]
close $f

set battery 0;
regexp "<response>(.*?)</response>" $input dummy current  ; #get current state
regexp "<r18>(.*?)</r18>" $current dummy charge  ; #get charge
regexp "<r19>(.*?)</r19>" $current dummy capacity  ; #get capacity
set battery [expr {($charge * 100) / $capacity}];

# set ReGaHss variables
set rega_cmd ""
append rega_cmd "dom.GetObject('Roomba-Batterie').State('$battery');"
rega_script $rega_cmd

exit 0;