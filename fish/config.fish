if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -g theme_display_date yes
set -g theme_date_format "+%F %H:%M"
set -g theme_display_git_default_branch yes
set -g theme_color_scheme dark

set __fish_git_prompt_showdirtystate yes
set __fish_git_prompt_showstashstate yes
set __fish_git_prompt_showuntrackedfiles yes
set __fish_git_prompt_showupstream yes
set __fith_git_prompt_color_branch yellow
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red

set __fish_git_prompt_char_dirtystate '✚ '
set __fish_git_prompt_char_invalidstate '✖ '
set __fish_git_prompt_char_stagedstate '⚫︎'
set __fish_git_prompt_char_stashstate '⚑ '

set -x PROTOCOL_BUFFERS_PYTHON_IMPLEMENTATION python

set PYENV_ROOT ~/.pyenv
fish_add_path $PYENV_ROOT/bin
pyenv init - | source

fish_add_path /opt/riscv/bin

alias ls "ls -a"
alias alias pbcopy='xsel --clipboard --input'

load_nvm > /dev/stderr

