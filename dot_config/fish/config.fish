# 1. Visuals & Environment
fastfetch
set fish_greeting ""

# 2. Abbreviations & Aliases
abbr -a cmatrix "unimatrix -n -s 96 -l 'o'"
abbr -a ff "fastfetch"
abbr -a czm "chezmoi"
abbr -a ll "ls -lah"
abbr -a clr "clear"
alias refish="source ~/.config/fish/**/*.fish"

# 3. Starship Shell Prompt Setup
function starship_transient_prompt_func
  starship module character
end
function starship_transient_rprompt_func
  starship module custom.transient_time
end
starship init fish | source
enable_transience

