# Set wallpaper
sudo cp -rf ../Backgrounds/* /usr/share/endeavouros/backgrounds/
nitrogen --set-zoom-fill /usr/share/endeavouros/backgrounds/stars.png

# Set lightdm config
sudo cp -rf ../etc/* /etc/

# Set fish as default shell
sudo chsh $USER -s "/bin/fish"

# Install bash config
cp -rf ../home/.bashrc ~/
cp -rf ../home/.gtkrc-2.0 ~/

# Install configs
cp -rf ../.config ~/

# load xed settings
cp -rf ../.local ~/
dconf load /org/x/editor/ < ../home/xedsettings
