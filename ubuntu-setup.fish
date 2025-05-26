wget https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish
source ./fisher.fish
fisher install jorgebucaran/fisher
chsh -s (which fish)

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
  zip                        \
  unzip                      \
  apt-transport-https

# install powerline fonts
git clone https://github.com/powerline/fonts.git
./fonts/install.sh

sudo apt install fzf
sudo apt install ripgrep
sudo apt install fd-find

fisher install oh-my-fish/theme-bobthefish
fisher install jethrokuan/z
fisher install jethrokuan/fzf
fisher install edc/bass

# install FUSE
sudo add-apt-repository universe
sudo apt install libfuse2

# install pyenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv

# install neovim
curl -LO https://github.com/neovim/neovim/releases/download/v0.11.1/nvim-linux-x86_64.appimage
chmod u+x nvim-linux-x86_64.appimage
sudo mv nvim-linux-x86_64.appimage /usr/local/bin
sudo ln -s /usr/local/bin/nvim-linux-x86_64.appimage /usr/local/bin/nvim
ln -s (realpath ../nvim) ~/.config/nvim

# install tmux
sudo apt install tmux
ln -s (realpath ../tmux) ~/.config/tmux

# install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

# fish config
rm ~/.config/fish/config.fish
rm ~/.config/fish/functions/fish_prompt.fish
rm ~/.config/fish/functions/fish_right_prompt.fish
ln -s (realpath ../fish/config.fish) ~/.config/fish/config.fish
ln -s (realpath ../fish/functions/fish_prompt.fish) ~/.config/fish/functions/fish_prompt.fish
ln -s (realpath ../fish/functions/fish_right_prompt.fish) ~/.config/fish/functions/fish_right_prompt.fish
ln -s (realpath ../fish/functions/nvm.fish) ~/.config/fish/functions/nvm.fish
ln -s (realpath ../fish/functions/nvm_find_nvmrc.fish) ~/.config/fish/functions/nvm_find_nvmrc.fish
ln -s (realpath ../fish/functions/load_nvm.fish) ~/.config/fish/functions/load_nvm.fish

# install stable nodejs
echo 'nvm install stable --latest-npm' | fish
echo 'nvm alias default stable' | fish

# install lazygit
set LAZYGIT_VERSION (curl -s https://api.github.com/repos/jesseduffield/lazygit/releases/latest | grep -Po '"tag_name": "v\K[^"]+')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v$LAZYGIT_VERSION/lazygit_{$LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit -D -t /usr/local/bin/

