ping archlinux.org

    or for wifi

    check if wifi is blocked
    rfkill list
    rfkill unblock wifi

    ip link # check for wifi interface
    iwctl
    device list
    station <device> scan
    station <device> get-networks
    station <device> connect "ID"
    exit

timedatectl set-ntp true

fdisk -l

Partition disk
    Create 2G EFI System (sdX1), and rest Linux filesystem for root / (sdx2)
cfdisk /dev/sdX

Format
mkfs.fat -F32 /dev/sdX1

mkfs.ext4 /dev/sdX2

Mount partitions
mount /dev/sdX2 /mnt
mkdir /mnt/boot
mount /dev/sdX1 /mnt/boot

Install base system
pacstrap /mnt base linux linux-firmware nano

Generate fstab
genfstab -U /mnt >> /mnt/etc/fstab

Chroot into new system
arch-chroot /mnt

Set Timezone
ln -sf /usr/share/zoneinfo/America/Guyana /etc/localtime
hwclock --systohc

Set Locale
nvim /etc/locale.gen
    uncomment language en_US.UTF-8
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf

Set Hostname
echo "hostname" > /etc/hostname

Set Root Password
passwd

Install GRUB
pacman -S grub efibootmgr
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

Enable Network
pacman -S networkmanager
systemctl enable NetworkManager

Create a User
useradd -m -G wheel username
passwd username

Install sudo
pacman -S sudo
EDITOR=nano visudo
    uncomment the line %wheel ALL=(ALL:ALL) ALL

Reboot into Arch
exit
umount -R /mnt
reboot
    At the startup remove USB

DONE!

sudo pacman -S awesome xorg-xinit xorg-server xorg-xrandr xorg-xsetroot alacritty thunar xorg-xrdb xorg-xset xorg-xprop xclip xsel cliphist maim slop qt5ct qt6ct kvantum picom xdg-desktop-portal xdg-desktop-portal-gtk xdg-utils

Installing AUR:
sudo pacman -S --needed base-devel git

sudo nvim /etc/resolv.conf
Changed contents with

nameserver 1.1.1.1
nameserver 8.8.8.8

make file immutable
sudo chattr +i /etc/resolv.conf

sudo pacman -S --needed libxcb xcb-util-cursor iptables xorg-xwayland openvpn wireguard-tools networkmanager-openvpn

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

Download:
sudo pacman -S pipewire pipewire-pulse pipewire-jack pipewire-alsa wireplumber qpwgraph pavucontrol

Enable and start pipewire:
systemctl --user enable --now pipewire pipewire-pulse wireplumber

systemctl enable rtkit-daemon

sudo pacman -S noto-fonts noto-fonts-cjk noto-fonts-emoji

sudo pacman -S gnome-themes-extra 
paru -S gnome-themes-extra-gtk2 adwaita-qt5-git adwaita-qt6-git

(~ is your home directory, where all of your downloads, files etc. are)
(cd is how you navigate)
cd ~
(`rm -rf` removes a folder, just `rm` removes a file, if you cant remove something then probably that means its important, but if you wanna get rid of it you need to do `sudo rm (or add -rf for folder)` sudo eliviates your previliges and allows program to interact with your system as admin)
rm -rf paru

git clone https://github.com/scar28s/dotfilesx
cd dotfilesx/
('ls' shows contents of a current folder, 'ls -f' shows in-depth contents of a folder. if you forgot something, you can append `--help` to every single command: ex. `pacman --help`, `ls --help` `cd --help`)
mv .xinitrc ~/
mv awesome/ ~/.config/
cd ~/.config/
ls
cd ~
rm -rf dotfilesx/

nvim ~/.config/awesome/rc.lua
remove lines shown on the video
(neovim tutorial: moving with arrow keys (or hjkl), `i` to get into insert mode, to get out of insert or visual mode `v` for visual mode you press `Escape`, `dd` remove a whole line, `x` removes a character that your cursor is currently on in normal mode (not visual or insert mode), or you can just press `i` and remove how you normally remove stuff in a text editor. `/` to find something by a keyword. `n` to move forward to next found, `N` (shift + n) to go backwards, `:wq` will save and exit, `:q!` will exit and not make any changes, `:q` will just quit if you haven't made any changes, `:w` will just save but not exit. Generally you just wanna know how to enter insert mode and how to get out of it. Everything else is just for an ease of use.)
`/` search for monitor, press Esc
`dd` to remove the whole line like shown on the video
`:wq` 

reboot

`reboot` in console will reboot your pc, `poweroff` will power pc off, `systemctl suspend` will put your PC in sleep mode. There's a way to automatically put it in sleep mode, but I haven't done that yet and don't really wanna do it currently.

IMPORTANT. I forgor to tell this.
Connecting to wifi
    sudo nmtui
it will open a window in console where you can choose your wifi network and just choose it, type password, you're done.

`startx` starts your Window Manager. There's a way to do it with a cute UI, but fuck UI startx is much faster and my config is optimized for startx.

Window Manager keybinds:
`Windows + Q` - opens console
`Windows + C` - closes current tab/Window
`Windows + Shift + A/D` - will cycle backwards or forward. Think of is like a being left, d being right. That's how usually you mode in games.
`Windows + R` - run command. This will open all of your files
`Windows + V` - makes current window a floating one, if you need it or makes from floating to Tiling mode.
`Windows + F` - makes a window fullscreen
`Windows + 1-9` - switches workspaces
`Windows + Space` - IF your things are not stacking like they should be, check top right and see which mode your current workspace is in. If it's 2 floating windows then it's in floating mode, if its 7 squares, then you're in tiling mode. Windows + space or just clicking on icon on top right will fix it.
ALSO make sure that your actual windows are in Tiling mode and make sure they're not maximized.
`Windows + M` - to maximize or unmaximize.
`Windows + Ctrl + R` - will reboot your window manager configuration for changes to take place.
`Windows + Shift + Q` - will quit it. For me its easier to quit than reboot because with 3 monitors it fucks up sometimes.


do vesktop if you want discord
paru -S brave-bin vesktop
if you need signal or telegram on your pc
sudo pacman -S signal-desktop telegram-desktop


sudo -E nvim /etc/pacman.conf
`/` multilib and follow video instruction by uncommenting
again, follow video instructions and let me know which GPU you have.
sudo pacman -Sy
sudo pacman -S fastfetch
sudo pacman -S steam
