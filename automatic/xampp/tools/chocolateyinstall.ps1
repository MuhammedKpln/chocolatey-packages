$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url = 'https://www.apachefriends.org/xampp-files/7.4.8/xampp-windows-x64-7.4.8-0-VC15-installer.exe' # download url, HTTPS preferred

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    fileType       = 'exe'
    url            = $url

    softwareName   = 'xampp*'
    checksum       = '9c12a89fea0bd3b82f16b2db57f7e6de26dacf12'
    checksumType   = 'sha1'
    checksum64     = '9c12a89fea0bd3b82f16b2db57f7e6de26dacf12'
    checksumType64 = 'sha1'

    # MSI
    silentArgs     = "--mode unattended"
    validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
