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


# To change all the existing tab characters to match the current tab settings, use in vim
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


# Replace a key with another key (acting)
exec --no-startup-id setxkbmap -option caps:escape
or
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
ifconfig wlp2s0 | grep -E 'inet .* netmask' -o | grep -E '[[:digit:]]*\.?*' -o | tr -d '\n'


# Make JSON Formatted in vim
:execute '%!python -m json.tool'


# Learn so much things
curl cht.sh


# Find all files with the name ".c" and add the following code block to begining of this file
/*
 * Konu: <++>
 */

find . -type f -name "*.c*" -exec sed -i -e '1s/^/\/\*\n \* Konu: \<++\>\n \*\/\n\n/' {} \;


#Create a bootable usb

#ISO 9660 filesystem signature needs to be removed by running
wipefs --all /dev/sd[LETTER OF YOUR DEVICE]
#as root, before repartitioning and reformating the USB drive.

#  Format fat32
sudo mkfs.vfat /dev/sd[LETTER OF YOUR DEVICE]
#  Dump iso
sudo dd if=[YOUR ISO FILE] of=/dev/sd[LETTER OF YOUR DEVICE] bs=4M


# Rename the space character in all files and folders in the subdirectory with an underscore
find * -exec bash -c 'mv "${0// /\\\ }" "${0// /_}" 2>/dev/null' {} \;


# You should update your void linux system with this command
sudo xbps-instsall -Suv


# Navigate between titles in man pages. (oMg that's what I want)
/^[^ ].*


# Take video of a specific window (requires ffcast)
ffcast -w ffmpeg -f x11grab -show_region 1 -s %s -i %D+%c [OUTPUTFILENAME].mp4

# Take video of specific 3 windows (requires ffcast)
ffcast -www ffmpeg -f x11grab -show_region 1 -s %s -i %D+%c [OUTPUTFILENAME].mp4


# Compile htop-vim in voidlinux
./autogen.sh && ./configure --enable-unicode --enable-cgroup --enable-taskstats

# Deactivate an hardrive (detach)
# (This is for MacOS Mojave)
hdiutil detach /dev/disk[DISK_NUMBER]
