# use custom prompt
source $HOME/Code/dotfiles/ps1prompt

# add conda to path
export PATH="/Users/jcreinhold/miniconda3/bin:$PATH"

# set timezone so MATLAB stops complaining during parallel processing
export TZ=America/New_York

# add convenience aliases
if [ -f ~/.aliases ]; then
    source ~/.aliases
fi

# enable conda activate
. /Users/jcreinhold/miniconda3/etc/profile.d/conda.sh

# add for extended glob features (e.g., rm !(file.txt) to remove everything but file.txt)
shopt -s extglob

# add colors to command line in osx
export CLICOLOR=1

# enable a longer history
HISTFILESIZE=10000
HISTSIZE=2000
export HISTSIZE HISTFILESIZE
