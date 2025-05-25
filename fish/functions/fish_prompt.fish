function fish_prompt --description 'cosocaf original prompt'
    #Save the return status of the previous command
    set -l last_pipestatus $pipestatus
    set -lx __fish_last_status $status # Export for __fish_print_pipestatus.
    set -l status_color (set_color $fish_color_status)
    set -l statusb_color (set_color --bold $fish_color_status)

    printf '[%s] ' (date "+%H:%M:%S")

    set_color brblue
    printf '%s@%s ' $USER (prompt_hostname)

    set_color $fish_color_cwd
    printf '%s ' (prompt_pwd)

    printf '%s' (__fish_print_pipestatus '[' '] ' '|' "$status_color" "$statusb_color" $last_pipestatus)

    if not contains 0 $last_pipestatus
        set_color normal
        printf 'm9(^Д^)'
    end

    if not set -q __fish_git_prompt_show_informative_status
        set -g __fish_git_prompt_show_informative_status 1
    end
    if not set -q __fish_git_prompt_color_branch
        set -g __fish_git_prompt_color_branch brmagenta
    end
    if not set -q __fish_git_prompt_showupstream
        set -g __fish_git_prompt_showupstream "informative"
    end
    if not set -q __fish_git_prompt_showdirtystate
        set -g __fish_git_prompt_showdirtystate "yes"
    end
    if not set -q __fish_git_prompt_color_stagedstate
        set -g __fish_git_prompt_color_stagedstate yellow
    end
    if not set -q __fish_git_prompt_color_invalidstate
        set -g __fish_git_prompt_color_invalidstate red
    end
    if not set -q __fish_git_prompt_color_cleanstate
        set -g __fish_git_prompt_color_cleanstate brgreen
    end

    set_color normal
    printf '%s\n' (__fish_git_prompt)

    set_color normal
    if functions -q fish_is_root_user; and fish_is_root_user
        printf '# '
    else
        printf '> '
    end
end
