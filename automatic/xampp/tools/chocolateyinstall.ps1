$ErrorActionPreference = 'Stop'; 
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url        = 'https://www.apachefriends.org/xampp-files/7.1.8/xampp-win32-7.1.8-0-VC14-installer.exe' # download url, HTTPS preferred

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url

  softwareName  = 'xampp*' 
  checksum      = 'b4d2fe505d112d3e2b97fe7ba672f42a102139c0'
  checksumType  = 'sha1'
  checksum64    = 'b4d2fe505d112d3e2b97fe7ba672f42a102139c0'
  checksumType64= 'sha1'

  # MSI
  silentArgs    = "--mode unattended"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

