echo "BACKING UP..."
mkdir ~/safestore
sudo mount /dev/sdb1 ~/safestore
cd ~/safestore
isDevMounted () { findmnt -rno SOURCE        "$1" >/dev/null;}
if isDevMounted "/dev/sdb1"; 
   then 
    echo "device is mounted"
   else echo "device is not mounted"&&exit
fi

dates=$(cat last)
echo "last backup was done on $dates"
dates=$(date +%F)
##backups
echo "Creating directory backup"
mkdir ~/backup

echo "Backing up ofone..."

#ofono-phonesim
mkdir -p ~/backup/etc/ofono
cp /etc/ofono/phonesim.conf ~/backup/etc/ofono/phonesim.conf

echo "Populating list of packages, mirrorlist and pacman conf..."
pacman -Qqe > ~/backup/pacmanlist
cp /etc/pacman.conf ~/backup/pacman.conf
mkdir ~/backup/etc/pacman.d
cp /etc/pacman.d/mirrorlist ~/backup/etc/pacman.d/mirrorlist

echo "Backing up dotfiles..."
##dotfiles
mkdir ~/backup/dotfiles
cp -ra ~/.config ~/backup/dotfiles/.config
cp -ra ~/.ssh ~/backup/dotfiles/.ssh
cp ~/.zshrc ~/backup/dotfiles/.zshrc
cp ~/.zsh_history ~/backup/dotfiles/.zsh_history
cp ~/.p10k.zsh ~/backup/dotfiles/.p10k.zsh

echo "Compressing..."
tar -cvf $dates.tar ~/backup > /dev/null
echo $dates > last


echo "Unmounting and cleaning up"
cd ~
sudo umount /dev/sdb1
rm -rf ~/backup
rm -rf ~/safestore