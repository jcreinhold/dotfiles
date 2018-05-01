# use custom prompt
source $HOME/Code/dotfiles/ps1prompt

# save unmodified path
export OLD_PATH=$PATH

# load rbenv 
eval "$(rbenv init -)"

# add miniconda to path
export PATH="/Users/jreinhold/miniconda3/bin:$PATH"
export NEW_PATH=$PATH

# disable or enable conda by removing/adding it to path
disable_conda () { 
    export PATH=$OLD_PATH 
}
enable_conda () { 
    export PATH=$NEW_PATH 
}

# set timezone so MATLAB stops complaining during parallel processing
export TZ=America/New_York

# add convenience aliases
if [ -f ~/.aliases ]; then
    source ~/.aliases
fi
