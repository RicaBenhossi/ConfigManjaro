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
echo "====================> Update the system"
echo
echo 'Press any key to continue...'; read -k1 -s
echo
sudo pacman -Syu
echo
echo "====================> Install asdf"
echo
echo 'Press any key to continue...'; read -k1 -s
echo
cd ~
git clone https://github.com/asdf-vm/asdf.git ~/.asdf &&
echo
echo "====================> Install tree to terminal"
echo
echo 'Press any key to continue...'; read -k1 -s
echo
sudo pamac install tree &&
echo
echo "====================> Install Neovim"
echo
echo 'Press any key to continue...'; read -k1 -s
echo
sudo pamac install neovim -y &&
echo
echo "====================> Configure ZSH"
echo
echo 'Press any key to continue...'; read -k1 -s
echo
git clon git@github.com:RicaBenhossi/ConfigManjaro.git ~/MyConfigs
echo
echo "--------------------> Installing fonts"
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
rm -f ~/.p10k.zsh;
mkdir -p ~/.config/nvim;
ln -s $config_folder/.zshrc ~/.zshrc;
ln -s $config_folder/.sh_aliases ~/.sh_aliases;
ln -s $config_folder/.p10k.zsh ~/.p10k.zsh;
ln -s $config_folder/.bashrc ~/.bashrc;
ln -s $config_folder/init.vim ~/.config/nvim/init.vim;
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
echo "====================> Download ssh keys"
echo
echo 'Download of your keys on Google Drive and store them in ~/.ssh. Press any key to continue...'; read -k1 -s
echo
chmod 600 ~/.ssh/id_ed25519 &&
chmod 600 ~/.ssh/id_ed25519.pub &&
ssh-add ~/.ssh/id_ed25519 &&
echo
timeout 3
echo
read -rsp $"Configuration process is finished. Press any key to proceed..."
echo
exit
