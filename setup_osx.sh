#!/bin/bash

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
	echo "You will need to setup the research directory!"

        echo "Symlinking dotfiles"
        cd ~
        ln -s Code/dotfiles/profile .profile
        ln -s Code/dotfiles/vimrc .vimrc
        ln -s Code/dotfiles/tmux.conf .tmux.conf
        ln -s Code/dotfiles/ghci .ghci
        source ~/.profile
        ;;
    n|N) echo "Skipping." ;;
    *) echo "Bad input." exit 1 ;;
esac


read -p "Install Anaconda? [Y,n]" anaconda_install
CONDA_INSTALL=${anaconda_install:-Y}
case $CONDA_INSTALL in
    y|Y) 
        ~/Code/dotfiles/install_conda.sh
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
