#!/bin/tclsh

proc uniqkey { } {
     set key   [ expr { pow(2,31) + [ clock clicks ] } ]
     set key   [ string range $key end-8 end-3 ]
     set key   [ clock seconds ]$key
     return $key
}

proc sleep { ms } {
    set uniq [ uniqkey ]
    set ::__sleep__tmp__$uniq 0
    after $ms set ::__sleep__tmp__$uniq 1
    vwait ::__sleep__tmp__$uniq
    unset ::__sleep__tmp__$uniq
}