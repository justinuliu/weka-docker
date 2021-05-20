winget install 'Docker Desktop'
winget install VcXsrv
$DesktopPath = [Environment]::GetFolderPath("Desktop")
Copy-Item ".\config.xlaunch" -Destination $DesktopPath
