$ErrorActionPreference = 'Stop'; 
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url        = 'https://www.apachefriends.org/xampp-files/7.2.5/xampp-win32-7.2.5-0-VC15-installer.exe' # download url, HTTPS preferred

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url

  softwareName  = 'xampp*' 
  checksum      = 'D7CEB1B7A8081141DD8CA6E69C305145150584E0'
  checksumType  = 'sha1'
  checksum64    = 'D7CEB1B7A8081141DD8CA6E69C305145150584E0'
  checksumType64= 'sha1'

  # MSI
  silentArgs    = "--mode unattended"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs