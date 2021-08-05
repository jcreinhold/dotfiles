# bash specific options
if [ -n "$BASH_VERSION" ]; then
    # custom command prompt
    source $HOME/Code/dotfiles/ps1prompt
    # add for extended glob features (e.g., rm !(file.txt) to remove everything but file.txt)
    shopt -s extglob
    # shell integration for iterm on macbook
    test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
fi

# add colors to command line in osx
export CLICOLOR=1

# add conda to path
export PATH="${HOME}/miniconda3/bin:$PATH"

# add sbin to path
export PATH="/usr/local/sbin:$PATH"

# set timezone so MATLAB stops complaining during parallel processing
export TZ=America/New_York

# add convenience aliases
if [ -f ~/.aliases ]; then
    source ~/.aliases
fi

# enable conda activate
source $HOME/miniconda3/etc/profile.d/conda.sh

# enable a longer history
HISTFILESIZE=10000
HISTSIZE=2000
export HISTSIZE HISTFILESIZE

export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"

