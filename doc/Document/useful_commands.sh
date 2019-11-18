#!/dev/null

# After editing the /etc/default/grub file# update grub command:
grub-mkconfig -o /boot/grub/grub.cfg


# For en-uk Keyboard layout
setxkbmap [ COUNTRY CODE ]
setxkbmap gb


# Opening "nvidia settings" with optirun
optirun -b none nvidia-settings -c :8


# Turn the graphic card off, respectively on
tee /proc/acpi/bbswitch <<<OFF
tee /proc/acpi/bbswitch <<<ON


# Get external graphic card status
cat /proc/acpi/bbswitch


# Connect a wifi from command line that the wifi already saved
nmcli device wifi rescan
nmcli device wifi list
nmcli device wifi connect [ WIFI SSID ] password [ PASSWORD ]


# Git fix your current pushed commit without creating a new commit
git commit --amend


# Just print readable string characters from a (data) file
string [ FILENAME ]


# Just print the line that occours only once
sort [ FILENAME ] | uniq -u


# To change all the existing tab characters to match the current tab settings,
# use in vim
:retab


# Fold specified lines in vim
:[ BEGGINING ],[ END ]fo
:18,24fo


# Vim source codes and config files
/usr/share/vim/vim81


# date & time
date +%Y/%m/%d_%H:%M:%S


# Print size of a folder (but just the folder not inside)
du [ FOLDER ] -hx | grep -v /


# Required package for ranger preview
sudo pacman -S w3m


# Login, suspend, lid... settings
/etc/systemd/logind.conf


# Print just specified line
[ OUTPUT ] | sed -n [X]p


# Reload Xresources
xrdb -merge ~/.Xresources


# Sed groups, search digits and put : after digits
cat [ FILE ] | sed -r 's/([ [:digit:] ]) /\1:/' > [ NEW_FILE ]


# Keyboard repeat
xset r rate [ MS_DELAY_TIME ]
xset r rate 200


# Vim Search for replace
press c
press /


# List all the application on the ios device that plugged in
ideviceinstaller -l | awk -F ', ' '{printf $3 "\n"}' | cat -n


# Pick random file from ls
ls | shuf -n1


# Get full path of a file
readlink -f [ FILE_NAME ]


# Delete spaces before end of the line
%s/\s*$//g


# Paste (add) default set up tmux conf
tmux show -g >> ~/.tmux.conf


# Set permenately tmux configuration file
tmux source-file [ CONFIG_FILE ]
tmux source-file .config/tmux/tmux.conf


# Search pattern in a folder (inside all files)
grep -rniwl '.' -e 'just black'
  -r or -R is recursive,
  -n is line number, and
  -w stands for match the whole word.
  -l (lower-case L) can be added to just give the file name of matching files.


# Disable Junk Notes just show valuable Errors on compile, compiling
g++ [ whatever.cpp ] -Wfatal-errors


# Make netctl work sory for not obvious comment
ip link set wlp2s0 down


# Netctl doing nothing? Maybe its running in the background as a "service" Try:
systemctl restart netctl@[ NAME OF YOUR PROFILE ]


# Format a disk
sudo mkfs.[ FILE_SYSTEM ] [ DISK ]
sudo mkfs.vfat /dev/sdc1


# Replace a key with another key (acting) on i3
#exec --no-startup-id setxkbmap -option caps:escape
#or
xmodmap -e 'keycode 87 = grave'
xmodmap -e 'keycode 85 = d'

all the names can be found in this file:
  /usr/include/X11/keysymdef.h
  or
  https://fsymbols.com/keyboard/linux/compose/
  or
  https://www.cambiaresearch.com/articles/15/javascript-char-codes-key-codes


# Compile with 4 thread
make -j4


# Get ip address of wlp2s0
ifconfig wlp2s0 | grep -E 'inet .* netmask' -o |
	grep -E '[[:digit:]]*\.?*' -o| tr -d '\n'


# Make JSON Formatted in vim
:execute '%!python -m json.tool'


# Learn so much things
curl cht.sh


# Find all files with the name ".c" and add the following code block to
# begining of this file
#/*
# * Konu: <++>
# */

find . -type f -name "*.c*" -exec sed -i -e '1s/^/\/\*\n \* Konu: \<++\>\n \*\/\n\n/' {} \;


#Create a bootable usb

#ISO 9660 filesystem signature needs to be removed by running
wipefs --all /dev/sd[LETTER OF YOUR DEVICE]
#as root, before repartitioning and reformating the USB drive.

#  Format fat32
sudo mkfs.vfat /dev/sd[LETTER OF YOUR DEVICE]
#  Dump iso
sudo dd if=[YOUR ISO FILE] of=/dev/sd[LETTER OF YOUR DEVICE] bs=4M


# Rename the space character in all files and folders in the subdirectory with
# an underscore
find * -exec bash -c 'mv "${0// /\\\ }" "${0// /_}" 2>/dev/null' {} \;


# You should update your void linux system with this command
sudo xbps-instsall -Suv


# Navigate between titles in man pages. (oMg that's what I want)
/^[^ ].*


# Take video of a specific window (requires ffcast)
ffcast -w ffmpeg -f x11grab -show_region 1 -s %s -i %D+%c [OUTPUTFILE].mp4

# Take video of specific 3 windows (requires ffcast)
ffcast -www ffmpeg -f x11grab -show_region 1 -s %s -i %D+%c [OUTPUTFILE].mp4


# Compile htop-vim in voidlinux
./autogen.sh && ./configure --enable-unicode --enable-cgroup --enable-taskstats

# Deactivate an hardrive (detach)
# (This is for MacOS Mojave)
hdiutil detach /dev/disk[DISK_NUMBER]


# Redirect to /etc/resolv.conf
printf "nameserver 1.1.1.1\nnameserver 1.0.0.1" | sudo tee /etc/resolv.conf


# Print touching or not, ag = theSilverSearcher
idevicesyslog | ag Touching | awk -F with '{printf $2 "\n"}'


# Print Key names for defining key combinations (hotkeys)
grep "compose:" /usr/share/X11/xkb/rules/base.lst


# Amixer increase (and "-" for decrease) volume of Master
amixer -c 0 sset Master 1dB+


# Find video files even if the endswith of the name of file
# not include .mov, .mp4 or whatever
find . type f -exec file -N -i -- {} + | grep video


# Hackintosh activate sound/audio
#1. Download AppleALC from its repository
#2. Download Lilu from its repository
#3. Copy these files to /System/Library/Extensions directory
#4. Copy these files to /Volumes/EFI/EFI/CLOVER/Kexts/Other directory also
#5. Change these values:
#     in /Volumes/EFI/EFI/CLOVER/config.plist
#     Devices > Audio > Inject = 0,
#     Devices > Audio > ReseHDA = True
#     Devices > Properties > PciRoot(0)/Pci(0x1f,3) > layout-id = 99 (Remove #)

     # 99 for auto detecting headphones and speaker
#6. Run
     sudo chmod 755 /System/Library/Extensions &&
     sudo chown root:wheel /System/Library/Extensions;
     sudo kextcache -i /
     sudo reboot


# Xorg key names list
/usr/include/xkbcommon/xkbcommon-keysyms.h


# Find all images and open with sxiv in fullscreen, thumbnail mode
sxiv -tf $(find . type f -exec file -N -i -- {} + 2>/dev/null |
	grep image | sed 's/:.*//g')


# Look inside the current folder if there is a file open it with [PROGRAM]
while true;
do
  if ! [ -z "$(ls -A .)" ]; then
    [PROGRAM] ./*
  fi
done


# Find the longest word in a list
cat ${XDG_CACHE_HOME:-"$HOME/.cache"}/turkish_words |
	sed '/\s/d' | tac | sed 1q


# Enable Kill/Close Finder in MacOS
defaults write com.apple.finder QuitMenuItem -bool true

# Disable Kill/Close Finder in MacOS
defaults write com.apple.finder QuitMenuItem -bool false


# Mount hfs with read and write in linux
sudo mount -r hfsplus -o force,rw /dev/sdXY /mnt/d
# or
sudo mount -o force,rw /dev/sdXY /mnt/d

# Get the chmod numerical value for a file
stat --format '%a' <file>

# Disable PC speaker
sudo rmmod pcspkr


# Spin down a disk
hdparm -Y /dev/sdb2 1>/dev/null;

# Sort by length
S T D I N | awk '{ print length(), $0 | "sort -n" }' | cut -d -f2-

# Download youtube playlist with enumerate
youtube-dl [PLAYLIST_LINK] -o '%(playlist_index)s - %(title)s.%(ext)s'

# Take input from user in shell
read -p "Target folder: " folder

# If variable empty in shell
if ! [ "$q" = "" ]; then 
  echo "NOT empty"
fi


# Convert non ASCII characters to ASCII characters with one liner
iconv -f utf-8 -t ascii//translit [FILE.txt]


# Redirect all outputs to "nothing"
[COMMAND] 2>&1 >/dev/null


## Open a free wordpress site with heroku
#Instructions are there: 
#https://github.com/mhoofman/wordpress-heroku


# Parse google seach auto completion using jq and sed
[JSON STDIN] |
  jq -r '.[][][]? | select(.==tostring)' |
  sed 's/\(.*<b>\)\(.*[^<\/b>]\)<\/b>/\2/g'


# Remove pacman cached and insallation files
pacman -Scc
