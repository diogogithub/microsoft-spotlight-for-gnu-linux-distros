#!/bin/sh

#
# spotlight.sh
#
# Diogo Cordeiro
# www.diogo.site
#

sleep 5
ping -q -c 1 -W 1 8.8.8.8 >/dev/null || exit

WALLPAPER="/opt/login-background.jpg"
API="https://arc.msn.com/v3/Delivery/Cache?pid=209567&fmt=json&rafb=0&ua=WindowsShellClient%2F0&disphorzres=9999&dispvertres=9999&lo=80217&pl=en-US&lc=en-US&ctry=us&time="
TIME=$( date '+%Y-%m-%dT%H:%M:%SZ' )

while [ ! -s "$WALLPAPER.new" ]
do
        REQUEST_RESULT=$( curl --silent "$API$TIME" -H 'Host: arc.msn.com' -H 'Connection: keep-alive' -H 'Cache-Control: max-age=0' )
        for j in `grep -Eo "landscape.{56}https:.{51}binary.{9}" <<< $REQUEST_RESULT | grep -Eo "https:.{51}binary.{9}"`
        do
                j=$( sed "s@\\\\@@g" <<< $j )
                curl --silent $j > "$WALLPAPER.new"
        done
done

mv "$WALLPAPER.new" "$WALLPAPER"
