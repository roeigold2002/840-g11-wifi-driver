# --- יצירת תיקיות ---
New-Item -Path "C:\Drivers" -ItemType Directory -Force | Out-Null

# --- הורדת דרייברים ---
Write-Host "Downloading drivers..."

Invoke-WebRequest -Uri "https://ftp.hp.com/pub/softpaq/sp157001-157500/sp157284.exe" -OutFile "C:\Drivers\sp157284.exe"
Invoke-WebRequest -Uri "https://ftp.hp.com/pub/softpaq/sp155501-156000/sp155883.exe" -OutFile "C:\Drivers\sp155883.exe"

# --- התקנת דרייברים (silent) ---
Write-Host "Installing driver sp157284.exe..."
Start-Process -FilePath "C:\Drivers\sp157284.exe" -ArgumentList "/s" -Wait

Write-Host "Installing driver sp155883.exe..."
Start-Process -FilePath "C:\Drivers\sp155883.exe" -ArgumentList "/s" -Wait

Write-Host "All drivers installed successfully."

# --- הסרת העדכון KB5065848 ---
Write-Host "Removing update package KB5065848..."
Start-Process -FilePath "Dism.exe" -ArgumentList "/online", "/remove-package", "/packagepath:C:\Windows\servicing\packages\package_for_kb5065848~31bf3856ad364e35~amd64~~26100.5058.1.0.mum" -Wait -NoNewWindow

Write-Host "Update KB5065848 removed successfully."
