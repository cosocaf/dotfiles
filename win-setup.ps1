New-Item $PSScriptRoot/tmp -ItemType Directory

# winget
winget import $PSScriptRoot/winget.json

# reload env
$env:PATH = [System.Environment]::GetEnvironmentVariable("PATH", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("PATH", "User")

# pwsh
sudo New-Item -ItemType SymbolicLink -Path ~/.oh-my-posh.json -Target $PSScriptRoot/.oh-my-posh.json -Force 
sudo New-Item -ItemType SymbolicLink -Path $Profile -Target $PSScriptRoot/profile.ps1 -Force

# nvim
Invoke-WebRequest -Uri "https://github.com/PowerShell/PowerShellEditorServices/releases/latest/download/PowerShellEditorServices.zip" -OutFile $PSScriptRoot/tmp/PowerShellEditorServices.zip
Expand-Archive -Path $PSScriptRoot/tmp/PowerShellEditorServices.zip -DestinationPath $PSScriptRoot/nvim/vendor/PowerShellEditorServices
sudo New-Item -ItemType SymbolicLink -Path $env:LOCALAPPDATA/nvim -Target $PSScriptRoot/nvim -Force

Remove-Item -Recurse -Force $PSScriptRoot/tmp

