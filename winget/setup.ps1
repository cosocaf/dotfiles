$items = @(
  'Microsoft.PowerShell'
  'JanDeDobbeleer.OhMyPosh'
  'Git.Git'
  'Microsoft.VisualStudio.2022.Community'
  'Neovim.Neovim'
  'OpenJS.NodeJS'
  'Kitware.CMake'
  'Google.Chrome'
  'Microsoft.PowerToys'
  'Nvidia.GeForceExperience'
  'Docker.DockerDesktop'
)

$installed = winget list

foreach ($item in $items) {
  $str = $installed | Select-String $item
  if ([string]::IsNullOrEmpty($str)) {
    winget install -e --id $item
  }
}

winget upgrade --all

