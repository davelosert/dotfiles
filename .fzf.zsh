# Setup fzf
# ---------
if [[ ! "$PATH" == */home/davidlosert/.fzf/bin* ]]; then
  export PATH="$PATH:/home/davidlosert/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/davidlosert/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/davidlosert/.fzf/shell/key-bindings.zsh"

export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_DEFAULT_OPTS='--height 60% --color dark,hl:33,hl+:37,fg+:235,bg+:136,fg+:254
--color info:254,prompt:37,spinner:108,pointer:235,marker:235'

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"

export FZF_ALT_C_COMMAND='fd --type d'
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"

