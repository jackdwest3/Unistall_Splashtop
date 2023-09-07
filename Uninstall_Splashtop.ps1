# Uninstall Splashtop software and remove associated registry entries and folders

# Uninstall the Splashtop software using MSIExec
$msiExecArgs = "/x {B7C5EA94-B96A-41F5-BE95-25D78B486678} /qn"
Start-Process -FilePath "msiexec.exe" -ArgumentList $msiExecArgs -Wait

# Delete registry entries for Splashtop Inc. (32-bit and 64-bit)
Remove-ItemProperty -Path "HKLM:\SOFTWARE\Splashtop Inc." -Name "*" -Force -ErrorAction SilentlyContinue
Remove-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Splashtop Inc." -Name "*" -Force -ErrorAction SilentlyContinue

# Remove the Splashtop Server folder
Remove-Item -Path "C:\Program Files (x86)\Splashtop\Splashtop Remote\Server" -Recurse -Force -ErrorAction SilentlyContinue

# Remove the Splashtop Temp folder
Remove-Item -Path "C:\ProgramData\Splashtop\Temp" -Recurse -Force -ErrorAction SilentlyContinue

# Stop and delete the SSUService using sc.exe
Start-Process -FilePath "sc.exe" -ArgumentList "stop SSUService" -Wait -NoNewWindow -ErrorAction SilentlyContinue
Start-Process -FilePath "sc.exe" -ArgumentList "delete SSUService" -Wait -NoNewWindow -ErrorAction SilentlyContinue

# Remove the Splashtop Software Updater folders
Remove-Item -Path "C:\ProgramData\Splashtop\Splashtop Software Updater" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path "C:\Program Files (x86)\Splashtop\Splashtop Software Updater" -Recurse -Force -ErrorAction SilentlyContinue

Write-Host "Splashtop software and associated entries have been removed."
