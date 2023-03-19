# install libs and tools
sudo apt install             \
  build-essential            \
  libffi-dev                 \
  libssl-dev                 \
  zlib1g-dev                 \
  liblzma-dev                \
  libbz2-dev                 \
  libreadline-dev            \
  libsqlite3-dev             \
  libopencv-dev              \
  tk-dev                     \
  wget                       \
  apt-transport-https

# install powerline fonts
git clone https://github.com/powerline/fonts.git
./fonts/install.sh

sudo apt install fzf

fisher install oh-my-fish/theme-bobthefish
fisher install jethrokuan/z
fisher install jethrokuan/fzf

# install FUSE
sudo add-apt-repository universe
sudo apt install libfuse2

# install pyenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv

# install neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
sudo mv nvim.appimage /usr/local/bin
sudo ln -s /usr/local/bin/nvim.appimage /usr/local/bin/nvim
ln -s (realpath ../nvim) ~/.config/nvim

rm ~/.config/fish/config.fish
ln -s (realpath ../fish/config.fish) ~/.config/fish/config.fish

