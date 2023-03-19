function fish_right_prompt -d 'cosocaf\'s '
  set last_status $status
  printf '%s ' (__fish_git_prompt)
  set_color normal
end
