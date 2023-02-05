oh-my-posh init pwsh --config "~/.oh-my-posh.json" --manual | Invoke-Expression

chcp 65001

Set-Alias touch New-Item

Remove-Alias rm

Function rm() {
  Remove-Item -Recurse -Force $args
}

Function which($item) {
  Get-Command $item | Format-Table -AutoSize -Wrap
}

