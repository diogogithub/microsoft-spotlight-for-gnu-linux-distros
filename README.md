# Microsoft Spotlight for GNU/Linux distros
Just set your display manager's login greeter's background to use the image set in this script's WALLPAPER variable (or vice versa) and put the script in the startup :)

E.g.: For lightdm you would have to edit /etc/lightdm/lightdm-gtk-greeter.conf to use /opt/login-background.jpg

## About the MS Spotlight API

The Spotlight API is located on the following endpoint:

`https://arc.msn.com/v3/Delivery/Cache?pid=209567&fmt=json&rafb=0&ua=WindowsShellClient%2F0&disphorzres=9999&dispvertres=9999&lo=80217&pl=en-US&lc=en-US&ctry=us&time=2017-12-31T23:59:59Z`

Where the expected arguments are:
 - `pid` : Purpose currently unknown
 - `fmt` : Output format, e.g. `json`
 - `rafb` : Purpose currently unknown
 - `ua` : Client user agent string
 - `disphorzres`: Screen width in pixels
 - `dispvertres`: Screen height in pixels
 - `lo` : Purpose currently uknown
 - `pl` : Locale, e.g. `en-US`
 - `lc` : Language, e.g. `en-US`
 - `ctry` : Country, e.g. `us`
 - `time` : Time, e.g. `2017-12-31T23:59:59Z`

The JSON response contains details about 6-7 images including image url, title, sha256, ads, etc.

Spotlight API URL was originally found in this [file](https://github.com/KoalaBR/spotlight/blob/3164a43684dcadb751ce9a38db59f29453acf2fe/spotlightprovider.cpp#L17), thanks to the author for their findings!
