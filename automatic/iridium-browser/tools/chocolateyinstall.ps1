$ErrorActionPreference = 'Stop'; 
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url        = 'https://downloads.iridiumbrowser.de/windows/iridiumbrowser-latest-x86.msi'
$url64      = 'https://downloads.iridiumbrowser.de/windows/iridiumbrowser-latest-x64.msi'
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = $url
  url64bit      = $url64
  softwareName  = 'iridiumbrowser*' 
  checksum      = '0B7BA643825A7235284884898B03E7A84274AC87'
  checksumType  = 'sha1'
  checksum64    = '4B65EF0CAD84E4F87C2376974C1BA7C61EC679FE'
  checksumType64= 'sha1'

  # MSI
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" # ALLUSERS=1 DISABLEDESKTOPSHORTCUT=1 ADDDESKTOPICON=0 ADDSTARTMENU=0
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs