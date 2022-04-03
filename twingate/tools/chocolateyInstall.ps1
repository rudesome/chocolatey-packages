$ErrorActionPreference = 'Stop';

$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url          = 'https://binaries.twingate.com/client/windows/versions/1.0.16.9232/TwingateWindowsInstaller.msi'
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
  silentArgs     = '/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
