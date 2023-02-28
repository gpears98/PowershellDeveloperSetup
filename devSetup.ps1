# URLs and Paths for developer tool downloads 
$vscURL = "https://go.microsoft.com/fwlink/?Linkid=852157"
$vscPath = "$env:USERPROFILE\Downloads\vscode.exe"
$gitURL = "https://desktop.githubusercontent.com/releases/2.9.4-1eb890f4/GitHubDesktopSetup.exe"
$gitPath = "$env:USERPROFILE\Downloads\GitHub Desktop Setup.exe"
$pyURL = "https://www.python.org/ftp/python/3.10.2/python-3.10.2-amd64.exe"
$pyPath = "$env:USERPROFILE\Downloads\python-3.10.2-amd64.exe"
$nodeURL = "https://nodejs.org/dist/v16.14.0/node-v16.14.0-x64.msi"
$nodePath = "$env:USERPROFILE\Downloads\node-v16.14.0-x64.msi"
$dockURL = "https://desktop.docker.com/win/stable/Docker%20Desktop%20Installer.exe"
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
Invoke-WebRequest -Uri $gitURL -Outfile $gitPath

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
$vscShortcut = (New-Object -ComObject WScript.Shell).CreateShortcut("$env:USERPROFILE\Desktop\Visual Studio Code.lnk")
$vscShortcut.TargetPath = "C:\Program Files\Microsoft VS Code\Code.exe"
$vscShortcut.Save()

# Create a shortcut for Docker
$dockShortcut = New-Object -ComObject WScript.Shell.CreateShortcut("$env:USERPROFILE\Desktop\Docker.lnk")
$dockShortcut.TargetPath = $dockerExe
$dockShortcut.Save()

# Create a shortcut for GitHub
$gitShortcut = New-Object -ComObject WScript.Shell.CreateShortcut("$env:USERPROFILE\Desktop\GitHub.lnk")
$gitShortcut.TargetPath = $githubExe
$gitShortcut.Save()