$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://www.picotech.com/download/software/sr/PicoScope6_r6_14_10.exe'

$cert = Get-ChildItem Cert:\CurrentUser\TrustedPublisher -Recurse | Where-Object { $_.Thumbprint -eq '‎bae19ab8365e8e08a17df2b42852a4afd81be504' }

if (!$cert) {
  Start-ChocolateyProcessAsAdmin "certutil -addstore 'TrustedPublisher' '$toolsDir\picotech.cer'"
}

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE' #only one of these: exe, msi, msu
  url           = $url
  softwareName  = 'picoscope*'
  checksum      = 'c6176816fb88f55d18224947a7e9fa681b75879f49bd1dfab2fa948261e9d460'
  checksumType  = 'sha256'
  silentArgs   = '/s /v"/qn"'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs