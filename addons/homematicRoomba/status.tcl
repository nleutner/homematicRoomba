        load tclrega.so

        #
        # Read Roomba data
        # Update der Daten alle 5 min., wenn Roomba aktiv

        # Variablen:
       #   Roomba-Bumps       Zahl
       #   Roomba-Wall        Zahl
       #   Roomba-VWall       Zahl
       #   Roomba-Distance    Zahl
       #   Roomba-Temperature Zahl (°C)
       #   Roomba-Charge      Zahl
       #   Roomba-Capacity    Zahl

        #

        set url http://$ip7/rwr.xml
        exec /usr/bin/wget -q -O /usr/local/addons/homematicRoomba/aktuell.xml $url

        set f [open "/usr/local/addons/homematicRoomba/aktuell.xml"]
        set input [read $f]
        close $f

        regexp "<response>(.*?)</response>" $input dummy current  ; #get current state

        regexp "<r12>(.*?)</r12>" $current dummy distance  ; #get distance
        regexp "<r17>(.*?)</r17>" $current dummy temperature  ; #get temperature
        regexp "<r18>(.*?)</r18>" $current dummy charge  ; #get charge
        regexp "<r19>(.*?)</r19>" $current dummy capacity  ; #get capacity


        #
        # set ReGaHss variables
        #

        set rega_cmd ""
        append rega_cmd "var c1 = dom.GetObject('Roomba-Temperature').State('$temperature');"
        append rega_cmd "var c2 = dom.GetObject('Roomba-Charge').State('$charge');"
        append rega_cmd "var c3 = dom.GetObject('Roomba-Capacity').State('$capacity');"
        rega_script $rega_cmd