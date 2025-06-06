# welcome
neofetch

# If you come from bash you might have to change your $PATH.
export GOPATH="$HOME/go"
export PATH="$HOME/bin:$HOME/.local/bin:$GOPATH/bin:/usr/local/bin:/usr/local/go/bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

export EDITOR="nvim" # set default editor for use in yazi, etc

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="juanghurtado"
#ZSH_THEME="fino"
ZSH_THEME="essembeh"
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# fzf key bindings and fuzzy completion
source <(fzf --zsh)
# fzf use rg instead of find
# Set the default command for fzf to use ripgrep (rg) to list files.
# - `rg --files` lists all files (excluding directories).
# - `--hidden` includes hidden files (those starting with `.`).
# - `--follow` follows symbolic links.
# - `--glob '!.git'` excludes the `.git` directory from search results.
export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --glob '!.git'"

# Set default options for fzf:
# - `--ansi`: Enables ANSI color codes for colored output.
# - `--multi`: Allows selecting multiple items at once.
# - `--preview='bat ... {}'`: Uses `bat` (a syntax-highlighting cat alternative) to preview file contents.
#   - `--color always`: Ensures bat outputs colored text.
#   - `--style numbers`: Shows line numbers.
#   - `--theme TwoDark`: Uses the "TwoDark" theme for syntax highlighting.
#   - `--line-range :80`: Displays only the first 80 lines of the file for better performance.
#   - `{}` is replaced by the currently selected file in fzf.
export FZF_DEFAULT_OPTS="--ansi --multi --preview='bat --color always --style numbers --theme TwoDark --line-range :80 {}'"

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"


# ALIASES
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

alias zshconfig="$EDITOR ~/.zshrc"
alias ohmyzsh="vi ~/.oh-my-zsh"
alias vi="nvim"
alias vim="nvim"
alias lg="lazygit"
alias ld="lazydocker"
# xclip copies directly to clipboard register
alias xclip='xclip -selection clipboard'
alias python=python3

# allows usage of lazygit with yadm
alias ly="lazygit -ucd ~/.local/share/yadm/lazygit -w ~ -g ~/.local/share/yadm/repo.git"

# bat actually named batcat because name conflict
# check if batcat is installed before creating the alias
if command -v batcat &> /dev/null; then
    alias bat=/usr/bin/batcat
fi

# source cargo env variables
. "$HOME/.cargo/env"

# load startup scripts for yadm
source $HOME/.startup

# put in bottom of .zshrc
# define function folder
fpath=( ~/.zfunctions "${fpath[@]}" )
# autoload everything
autoload -Uz $fpath[1]/*(.:t)

# yazi - move to current working directory when exiting yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
eval "$(zoxide init zsh)"
