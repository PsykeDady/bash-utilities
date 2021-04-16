function pomodoro {
        suonosveglia=~/Musica/sounds/alarm.wav
        if [ ! -e "$suonosveglia" ]; then 
                echo "suono sveglia non trovato"
                return 255
        fi
        if (( $# != 2 )); then
                echo "specificare due intervalli di tempo, quello di lavoro e poi quello di riposo"
                return 255
        fi

        sleep $1'm' || return 255
        notify-send -t 10000 'WE CICCIO, RIPOSA!'
        mplayer  "$suonosveglia"
        sleep $2'm' || return 255
        notify-send -t 10000 'FORZA A LAVORARE, FATTURAREE GIARGIANA'
        mplayer  "$suonosveglia"
}
