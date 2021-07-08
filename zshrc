source ~/.antigen/antigen.zsh

antigen use oh-my-zsh
antigen bundle brew
antigen bundle git
antigen bundle github
antigen bundle pip
antigen bundle python
antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions src
antigen bundle rupa/z

antigen theme candy

antigen apply

source ~/.profile
