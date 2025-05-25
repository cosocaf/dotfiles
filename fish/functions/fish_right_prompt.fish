function fish_right_prompt -d "cosocaf original right prompt"
    set -l last_pipestatus $pipestatus

    if not contains 0 $last_pipestatus
        set_color $fish_color_status
        printf '󱫚 '
    else
        set_color green
        printf '󱎫 '
    end

    printf '%sms' $CMD_DURATION
end
