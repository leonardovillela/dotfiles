#!/bin/sh
echo "Setting up your Mac..."

if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update

brew tap homebrew/bundle
brew bundle

mkdir $HOME/dev
mv $PWD $HOME/dev
cd $HOME/dev/dotfiles

echo "Installing Oh My Zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

./install_dotfiles
./macos.sh

chsh -s /bin/zsh

echo "Setting up ASDF version manager"
asdf plugin add nodejs
$ASDF_DIR/plugins/nodejs/bin/import-release-team-keyring
asdf plugin add yarn
asdf plugin ruby
asdf install

echo "Installing Oh My Zsh Plugins"
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo "Installing Hyper terminal plugins"
hyper i hyper-dracula
