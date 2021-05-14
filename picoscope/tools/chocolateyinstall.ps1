$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://www.picotech.com/download/software/sr/PicoScope6_6.14.44.5870.exe'

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
  checksum      = '06c8a3562ec0bd2cc75708b775671760b78e6a485b358e71fbdca6b6560e8f6f'
  checksumType  = 'sha256'
  silentArgs   = '/s /v"/qn"'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs