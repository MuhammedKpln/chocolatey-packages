$ErrorActionPreference = 'Stop'; 
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url        = 'https://www.apachefriends.org/xampp-files/7.1.11/xampp-win32-7.1.11-0-VC14-installer.exe' # download url, HTTPS preferred

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url

  softwareName  = 'xampp*' 
  checksum      = '870D4BD37AC66F573D2FDB92BC577D37D1498C50'
  checksumType  = 'sha1'
  checksum64    = '870D4BD37AC66F573D2FDB92BC577D37D1498C50'
  checksumType64= 'sha1'

  # MSI
  silentArgs    = "--mode unattended"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs