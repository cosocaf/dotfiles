if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -g theme_display_date yes
set -g theme_date_format "+%F %H:%M"
set -g theme_display_git_default_branch yes
set -g theme_color_scheme dark

set -x PROTOCOL_BUFFERS_PYTHON_IMPLEMENTATION python

set PYENV_ROOT ~/.pyenv
fish_add_path $PYENV_ROOT/bin
pyenv init - | source

fish_add_path /opt/riscv/bin

alias ls "ls -a"

