#!/bin/bash

read -p "Is xcode installed? [Y,n]" xcode_installed
XCODE_INSTALLED=${xcode_installed:-Y}
case $XCODE_INSTALLED in
    y|Y) echo "Continuing with setup." ;;
    n|N) echo "First install xcode." exit 1;;
    *) echo "Bad input." exit 1;;
esac

read -p "Install command line tools? [Y,n]" clt_install
CLT_INSTALL=${clt_install:-Y}
case $CLT_INSTALL in
    y|Y) 
        echo "Installing Command Line Developer Tools." 
        xcode-select --install
        echo "Agree to xcode license." 
        sudo xcodebuild -license
        ;;
    n|N) echo "Skipping." ;;
    *) echo "Bad input." exit 1 ;;
esac

read -p "Install homebrew? [Y,n]" brew_install
BREW_INSTALL=${brew_install:-Y}
case $BREW_INSTALL in
    y|Y) 
        echo "Installing homebrew."
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        ;;
    n|N) echo "Skipping." ;;
    *) echo "Bad input." exit 1 ;;
esac

read -p "Install brew packages? [Y,n]" brew_packages
BREW_PACKAGES=${brew_packages:-Y}
case $BREW_PACKAGES in
    y|Y) 
        echo "Installing packages through brew."
        brew update
        brew tap homebrew/science
        packages=(
            git
            tmux
        )
        brew install ${packages[@]}
        brew cleanup
        ;;
    n|N) echo "Skipping." ;;
    *) echo "Bad input." exit 1 ;;
esac

read -p "Install brew cask packages? [Y,n]" brew_cask
BREW_CASK=${brew_cask:-Y}
case $BREW_CASK in
    y|Y) 
        echo "Installing cask packages through brew."
        brew install caskroom/cask/brew-cask
        apps=(
            google-drive
            iterm2
            bettertouchtool
            flash
            flux
            caffeine
            mactex
            steam
        )
        brew cask install --appdir="/Applications" ${apps[@]}
        ;;
    n|N) echo "Skipping." ;;
    *) echo "Bad input." exit 1 ;;
esac

read -p "Get git repos? [Y,n]" git_repos
GIT_REPOS=${git_repos:-Y}
case $GIT_REPOS in
    y|Y) 
        echo "Getting github and gitlab repos"
        mkdir ~/Code
        cd ~/Code
        git clone https://github.com/jcreinhold/jcreinhold.github.io.git
        git clone https://github.com/jcreinhold/dotfiles.git
        
        mkdir ~/Research
        cd ~/Research
        git clone https://github.com/jcreinhold/scs-evolutionary-clustering.git
        git clone https://jcreinhold@gitlab.com/jcreinhold/image-analysis.git

        echo "Symlinking dotfiles"
        cd ~
        ln -s Code/dotfiles/profile .profile
        ln -s Code/dotfiles/vimrc .vimrc
        ln -s Code/dotfiles/tmux.conf .tmux.conf
        source ~/.profile
        ;;
    n|N) echo "Skipping." ;;
    *) echo "Bad input." exit 1 ;;
esac


read -p "Install Anaconda? [Y,n]" anaconda_install
CONDA_INSTALL=${anaconda_install:-Y}
case $CONDA_INSTALL in
    y|Y) 
        echo "Downloading Anaconda"
        cd ~/Downloads
        curl -O https://repo.continuum.io/archive/Anaconda3-4.3.1-MacOSX-x86_64.sh
        echo "Installing Anaconda"
        chmod 755 ./Anaconda3-4.3.1-MacOSX-x86_64.sh
        ./Anaconda3-4.3.1-MacOSX-x86_64.sh
        echo "Updating Anaconda"
        conda update conda
        conda update anaconda
        ;;
    n|N) echo "Skipping." ;;
    *) echo "Bad input." exit 1 ;;
esac

read -p "Get bash git prompt? [Y,n]" prompt_install 
PROMPT_INSTALL=${prompt_install:-Y}
case $PROMPT_INSTALL in
    y|Y) 
        echo "Getting the git prompt"
        curl -o ~/.git-prompt.sh \
            https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
        ;;
    n|N) echo "Skipping." ;;
    *) echo "Bad input." exit 1 ;;
esac
echo "Exiting setup script!"
