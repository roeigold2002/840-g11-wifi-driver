# --- יצירת תיקיות ---
New-Item -Path "C:\Drivers" -ItemType Directory -Force | Out-Null

# --- הורדת דרייברים ---
Write-Host "Downloading drivers..."

Invoke-WebRequest -Uri "https://ftp.hp.com/pub/softpaq/sp157001-157500/sp157284.exe" -OutFile "C:\Drivers\sp157284.exe"
Invoke-WebRequest -Uri "https://ftp.hp.com/pub/softpaq/sp155501-156000/sp155883.exe" -OutFile "C:\Drivers\sp155883.exe"

# --- התקנת דרייברים ---
Write-Host "Installing driver sp157284.exe..."
Start-Process -FilePath "C:\Drivers\sp157284.exe" -ArgumentList "/silent" -Wait

Write-Host "Installing driver sp155883.exe..."
Start-Process -FilePath "C:\Drivers\sp155883.exe" -ArgumentList "/silent" -Wait

Write-Host "All drivers installed successfully."
