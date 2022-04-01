$ErrorActionPreference = 'Stop';

$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url          = 'https://github.com/RocketChat/Rocket.Chat.Electron/releases/download/3.8.1/rocketchat-3.8.1-win.exe'
$checksum     = ''
$checksumType = ''

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'msi'
  url            = $url
  checksum       = $checksum
  checksumType   = $checksumType
  softwareName   = 'twingate'
  silentArgs     = '/qn /norestart /l*v "$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
