#!/bin/tclsh

load tclrega.so;

# incluce system variable mapping
source conf/config.tcl

# config
set sysvar Roomba-Batterie

if {[catch {exec ping -c 1 -s 1 $ip}] } then {

    set url http://$ip/rwr.xml
    if { [catch {exec /usr/bin/wget -q -O roomba.xml $url} error] } {
        puts stderr "Could not reach Roomba from $url \n$error"
        exit 1
    }

    set f [open "roomba.xml"]
    set input [read $f]
    close $f

    set battery 0;
    regexp "<response>(.*?)</response>" $input dummy current  ;
    regexp "<r18>(.*?)</r18>" $current dummy charge  ;
    regexp "<r19>(.*?)</r19>" $current dummy capacity  ;
    set battery [expr {($charge * 100) / $capacity}];

    # set ReGaHss variables
    set rega_cmd ""
    append rega_cmd "dom.GetObject('$sysvar').State('$battery');"
    rega_script $rega_cmd
}
exit 0;