$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://www.picotech.com/download/software/beta/PicoScope6_r6_14_23.exe'

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
  checksum      = '4c2ebff743398b59320be1508eb7d43d4b9dba079cf5fc30d6467509aa5c6821'
  checksumType  = 'sha256'
  silentArgs   = '/s /v"/qn"'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs