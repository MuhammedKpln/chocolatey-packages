$ErrorActionPreference = 'Stop'; 
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url        = 'https://www.apachefriends.org/xampp-files/7.2.1/xampp-win32-7.2.1-0-VC15-installer.exe' # download url, HTTPS preferred

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url

  softwareName  = 'xampp*' 
  checksum      = 'a38115af2912b8d772cdd683a215b91942741fbe'
  checksumType  = 'sha1'
  checksum64    = 'a38115af2912b8d772cdd683a215b91942741fbe'
  checksumType64= 'sha1'

  # MSI
  silentArgs    = "--mode unattended"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs