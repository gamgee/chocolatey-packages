# chocolatey packages

> **This project is archived because i switched to winget**

## Development tips

Generate empty package template

```powershell
choco new packageName
```

Build and install package from .nuspec file

```powershell
choco install -fdv C:\PATH\to\.nuspec
```

Build the package

```powershell
# run in package directory
choco pack
```

Test the package

```powershell
# run in package directory
choco install packageName -dv -s .
```

Push package to cocolatey community feed

```powershell
choco apikey --key your-api-key --source https://push.chocolatey.org/
choco push MyPackage.1.0.nupkg --source https://push.chocolatey.org/
```

## Resources

* [chocolatey.org How to create packages](https://chocolatey.org/docs/create-packages)
* [vagrant test environment](https://github.com/chocolatey/chocolatey-test-environment)
* [jsdelivr cdn for icon files](https://www.jsdelivr.com/)