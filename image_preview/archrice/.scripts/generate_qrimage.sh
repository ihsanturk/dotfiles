echo $1 | qrencode -o /tmp/qr.png -t png -s 5
feh /tmp/qr.png --zoom 200
