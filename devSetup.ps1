# URLs and Paths for developer tool downloads 
$vscURL = "https://go.microsoft.com/fwlink/?Linkid=852157"
$vscPath = "$env:USERPROFILE\Downloads\vscode.exe"
$gitURL = "https://desktop.githubusercontent.com/github-desktop/releases/3.1.8-2ada979c/GitHubDesktopSetup-x64.exe"
$gitPath = "$env:USERPROFILE\Downloads\GitHub Desktop Setup.exe"
$pyURL = "https://www.python.org/ftp/python/3.11.2/python-3.11.2-amd64.exe"
$pyPath = "$env:USERPROFILE\Downloads\python-3.11.2-amd64.exe"
$nodeURL = "https://nodejs.org/dist/v18.14.2/node-v18.14.2-x64.msi"
$nodePath = "$env:USERPROFILE\Downloads\node-v18.14.2-x64.msi"
$dockURL = "https://desktop.docker.com/win/main/amd64/Docker%20Desktop%20Installer.exe?utm_source=docker&utm_medium=webreferral&utm_campaign=dd-smartbutton&utm_location=module"
$dockPath = "$env:USERPROFILE\Downloads\Docker Desktop Installer.exe"

# Turn on Developer Mode
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock" -Name "AllowDevelopmentWithoutDevLicense" -Value 1

# Enable Hyper-V
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All

# Install WSL2
Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform

# Download VScode
Invoke-WebRequest -Uri $vscURL -OutFile $vscPath

# Download GitHub
Invoke-WebRequest -Uri $gitURL -OutFile $gitPath

# Download Python
Invoke-WebRequest -Uri $pyURL -OutFile $pyPath

# Download Node.js
Invoke-WebRequest -Uri $nodeURL -OutFile $nodePath

# Download Docker
Invoke-WebRequest -Uri $dockURL -OutFile $dockPath

# Install VScode
Start-Process -FilePath $vscPath -ArgumentList '/silent' -Wait

# Install Python
Start-Process -FilePath $pyPath -ArgumentList '/quiet', 'InstallAllUsers=1', 'PrependPath=1' -Wait

# Install Docker
Start-Process -FilePath $dockPath -ArgumentList '--quiet', '--wait' -Wait

# Install Node.js
Start-Process -FilePath $nodePath -ArgumentList '/qn', '/norestart' -Wait

#Install GitHub
Start-Process -FilePath $gitPath -ArgumentList '/VERYSILENT' -Wait

# Create a shortcut for VScode
$vscShell = New-Object -comObject WScript.Shell
$vscShortcut = $vscShell.CreateShortcut("$Home\Desktop\Visual Studio Code.lnk")
$vscShortcut.TargetPath = "C:\Program Files\Microsoft VS Code\Code.exe"
$vscShortcut.Save()

# Create a shortcut for Docker
$dockShell = New-Object -comObject WScript.Shell
$dockShortcut = $dockShell.CreateShortcut("$Home\Desktop\Docker.lnk")
$dockShortcut.TargetPath = "C:\Program Files\Docker\Docker\Docker Desktop.exe"
$dockShortcut.Save()

# Create a shortcut for GitHub
$gitShell = New-Object -comObject WScript.Shell
$gitShortcut = $gitShell.CreateShortcut("$Home\Desktop\GitHub.lnk")
$gitShortcut.TargetPath = "$env:USERPROFILE\AppData\Local\GitHubDesktop\app-2.8.2\GitHubDesktop.exe"
$gitShortcut.Save()

