# add conda to path
export PATH="${HOME}/miniconda3/bin:$PATH"

# add sbin to path
export PATH="/usr/local/sbin:$PATH"

# Lean
export PATH="$HOME/.elan/bin:$PATH"

<<<<<<< Updated upstream
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

# aws
export AWS_DEFAULT_PROFILE=saml 
export AWS_REGION=us-east-1

# ocaml opam
[[ ! -r $HOME/.opam/opam-init/init.zsh ]] || source $HOME/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
. "$HOME/.cargo/env"
=======
>>>>>>> Stashed changes
