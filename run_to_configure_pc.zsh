#! /usr/bin/zsh
echo
echo "***********************************************************"
echo "*                                                         *"
echo "*                  CONFIGURE NEW MACHINE                  *"
echo "*                                                         *"
echo "***********************************************************"
echo
# Variables
config_folder="/home/$USER/MyConfigs/Configs"

echo "====================> Setting the fastest mirror (can take a while)"
echo
echo 'Press any key to continue...'; read -k1 -s
echo
sudo pacman-mirrors --fasttrack
echo
echo "====================> Install asdf"
echo
echo 'Press any key to continue...'; read -k1 -s
echo
cd ~
git clone https://github.com/asdf-vm/asdf.git ~/.asdf &&
echo
echo "====================> Configure ZSH"
echo
echo "--------------------> Installing fonts"
echo
echo 'Press any key to continue...'; read -k1 -s
echo
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf -P ~/.local/share/fonts &&
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf -P ~/.local/share/fonts &&
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf -P ~/.local/share/fonts &&
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf -P ~/.local/share/fonts
echo
echo "--------------------> Configure files for zsh"
echo
echo "*** It will ask for Gihub\'s username and password or token."
echo "The token is in LastPass."
echo
cd ~ &&
rm -f ~/.zshrc;
rm -f ~/.sh_aliases;
# rm -f ~/.p10k.zsh;
mkdir -p ~/.config/nvim;
ln -s $config_folder/.zshrc ~/.zshrc_starship;
ln -s $config_folder/.sh_aliases ~/.sh_aliases;
# ln -s $config_folder/.p10k.zsh ~/.p10k.zsh;
ln -s $config_folder/init.vim ~/.config/nvim/init.vim;
echo
echo "====================> Download ssh keys"
echo
echo 'Copy your ssh keys and store them in ~/.ssh. Press any key to continue...'; read -k1 -s
echo
chmod 600 ~/.ssh/id_ed25519 &&
chmod 600 ~/.ssh/id_ed25519.pub &&
ssh-add ~/.ssh/id_ed25519 &&
echo
echo "====================> Downloading .gitconfig file"
echo
echo 'Press any key to continue...'; read -k1 -s
echo
cd ~
git clone git@gist.github.com:4fafb520ad03493ceac0a998e7c27f02.git git_config &&
rm -rf ~/.gitconfig &&
ln git_config/.gitconfig ~/ &&
echo
echo "====================> Configure function keys on keyboard k380"
echo
git clone https://github.com/jergusg/k380-function-keys-conf.git ~/k380-function-keys-conf;
echo 'Go to ~/k380-function-keys-conf and follow the README file for installing'
echo
echo "====================> Download zsh Plugins"
echo
echo "--------------------> fast-syntax-highlighting"
echo
echo 'Press any key to continue...'; read -k1 -s
echo
mkdir -p ~/.config/zsh/zsh-plugins &&
git clone git@github.com:zdharma/fast-syntax-highlighting.git ~/.config/zsh/plugins/fast-syntax-highlighting &&
ln $config_folder/clean_my.ini /.config/zsh/plugins/fast-syntax-highlighting/themes &&
source ~/.zshrc
fast-theme clean_my
echo
echo "====================> Load gnome-terminal configs"
echo
echo 'Press any key to continue...'; read -k1 -s
dconf load /org/gnome/terminal/legacy/profiles:/ < ~/MyConfig/Configs/gnome-terminal-profiles.dconf
echo
echo "====================> Update the system"
echo
echo 'Press any key to continue...'; read -k1 -s
echo
pamac upgrade &&
echo
echo "====================> Install Starship terminal"
echo
echo 'Press any key to continue...'; read -k1 -s
echo
pacman -S starship
echo
echo "====================> Install tree to terminal"
echo
echo 'Press any key to continue...'; read -k1 -s
echo
pamac install tree --no-confirm &&
echo
echo "====================> Install Make"
echo
echo 'Press any key to continue...'; read -k1 -s
echo
pamac install neovim --no-confirm &&
echo
echo "====================> Install pkg-config"
echo
echo 'Press any key to continue...'; read -k1 -s
echo
pacman -Sy pkg-config &&
echo
echo "====================> Install Neovim"
echo
echo 'Press any key to continue...'; read -k1 -s
echo
pacman -Sy make &&
echo
echo
read -rsp $"Configuration process is finished. Press any key to proceed..."
echo
exit
