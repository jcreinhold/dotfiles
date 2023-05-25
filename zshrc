fpath+=("${HOME}/.zsh/pure")

autoload -U promptinit; promptinit
prompt pure

<<<<<<< Updated upstream
antigen theme candy

antigen apply
=======
# add colors to command line in osx
export CLICOLOR=1

# enable a longer history
export HISTFILESIZE=100000
export HISTSIZE=20000

# set timezone so MATLAB stops complaining during parallel processing
export TZ=America/New_York

# shell integration for iterm on macbook
if [ -n "$BASH_VERSION" ]
then
    if [ -f "${HOME}/Code/dotfiles/ps1prompt" ]
    then
        source "${HOME}/Code/dotfiles/ps1prompt"
    fi
    # add for extended glob features (e.g., rm !(file.txt) to remove everything but file.txt)
    shopt -s extglob
    if [ -f "${HOME}/.iterm2_shell_integration.bash" ]
    then
        source "${HOME}/.iterm2_shell_integration.bash"
    fi
fi

# add convenience aliases
if [ -f "${HOME}/.aliases" ]
then
    source "${HOME}/.aliases"
fi

# ghcup haskell
if [ -f "${HOME}/.ghcup/env" ]
then
    source "${HOME}/.ghcup/env"
fi

# rbenv
if command -v rbenv &> /dev/null
then
    eval "$(rbenv init -)"
fi

# added by travis gem
if [ ! -s "${HOME}/.travis/travis.sh" ]
then
    source "${HOME}/.travis/travis.sh"
fi

# opam configuration
if [ ! -r "${HOME}/.opam/opam-init/init.zsh" ]
then
    source "${HOME}/.opam/opam-init/init.zsh"  > /dev/null 2> /dev/null
fi

# Setup rust
if [ -d "${HOME}/.cargo" ]
then
    source "${HOME}/.cargo/env"
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/jcreinhold/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/jcreinhold/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/jcreinhold/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/jcreinhold/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
>>>>>>> Stashed changes

