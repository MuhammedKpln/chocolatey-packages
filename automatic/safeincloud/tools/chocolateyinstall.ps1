$ErrorActionPreference = 'Stop'; 
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url        = 'https://safe-in-cloud.com/download/SafeInCloud_Setup.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url

  softwareName  = 'safeincloud*' 
  checksum      = '9878B733079E5F25F7C1249AB67D0E9A366CC7A5'
  checksumType  = 'sha1'
  checksum64    = '9878B733079E5F25F7C1249AB67D0E9A366CC7A5'
  checksumType64= 'sha1'

  # MSI
  silentArgs    = "/quiet /silent /n"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

