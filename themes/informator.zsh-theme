# ZSH Theme - informator
# Author: Patrick Wu <wotingwu@live.com>
# Theme based on my theme WSL theme, WSL only
autoload -Uz add-zsh-hook

export VIRTUAL_ENV_DISABLE_PROMPT=yes

function virtenv_indicator {
    if [[ -z $VIRTUAL_ENV ]] then
        psvar[1]=''
    else
        psvar[1]=${VIRTUAL_ENV##*/}
    fi
}

add-zsh-hook precmd virtenv_indicator


# Current Dir Shortener
local current_dir=' %{$fg[magenta]%}%14<...<%~%<<%{$reset_color%} '

# Git info
local git_info='$(git_prompt_status)%{$fg[cyan]%}$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_ADDED=" %{$fg[green]%}+"
ZSH_THEME_GIT_PROMPT_MODIFIED=" %{$fg[magenta]%}!"
ZSH_THEME_GIT_PROMPT_DELETED=" %{$fg[red]%}-"
ZSH_THEME_GIT_PROMPT_RENAMED=" %{$fg[blue]%}>"
ZSH_THEME_GIT_PROMPT_UNMERGED=" %{$fg[cyan]%}#"
ZSH_THEME_GIT_PROMPT_UNTRACKED=" %{$fg[yellow]%}?"
ZSH_THEME_GIT_PROMPT_PREFIX=" "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=":%{$fg[red]%}x"
ZSH_THEME_GIT_PROMPT_CLEAN=":%{$fg[green]%}o"

# NVM info
local nvm_info='$(nvm_prompt_info)'
ZSH_THEME_NVM_PROMPT_PREFIX="%{$fg[green]%} "
ZSH_THEME_NVM_PROMPT_SUFFIX="%{$reset_color%}"

# RVM info
local rvm_info='$(rvm_prompt_info)'
ZSH_THEME_RVM_PROMPT_PREFIX="%{$fg[red]%} "
ZSH_THEME_RVM_PROMPT_SUFFIX="%{$reset_color%}"


local exit_code="%(?,,[%{$fg[red]%}%B! %?%b%{$reset_color%}])"
local build_icon="%{$fg[cyan]%} \ue70f"
local build="%{$fg[cyan]%}`reg.exe query "HKLM\Software\Microsoft\Windows NT\CurrentVersion" /v "CurrentBuild" 2>&1 | egrep -o '([0-9]{5})'`%{$reset_color%}"
local userinfo="%(!.%{$fg[yellow]%}.)$USER %{$fg[blue]%}%m ${build}"
#PROMPT="${build}${nvm_info}${rvm_info}${current_dir}%# "
newline=$'\n'
PROMPT="%(1V.%{$fg[yellow]%}%1v %{$reset_color%}.)${userinfo}${nvm_info}${rvm_info}${git_info} %{$fg[magenta]%}%~%{$reset_color%}${newline}${exit_code}%(!.#.$) "
