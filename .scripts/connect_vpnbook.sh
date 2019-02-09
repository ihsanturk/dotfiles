#if [ "$2" == "cp" ]; then 
#	python3 -m vpnbook_password_get.py | xclip -selection clipboard
#fi
if [ "$2" == "cp" ]; then 
	sudo wget -q https://www.vpnbook.com/password.php -O /tmp/vpnpass.png 
	pass_text=$(sudo tesseract /tmp/vpnpass.png stdout)
	pass_text=${pass_text//[[:blank:]]/}
	echo "$pass_text" | xclip -selection clipboard
fi
if ! [ $1 ]; then
	read -p "Which port: " port
	sudo openvpn /home/ihsan/.scripts/vpn_files/*$port*
else
	sudo openvpn /home/ihsan/.scripts/vpn_files/*$1*
fi
