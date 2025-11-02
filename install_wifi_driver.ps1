# --- יצירת תיקיות ---
New-Item -Path "C:\Drivers" -ItemType Directory -Force | Out-Null

# --- הורדת דרייברים ---
Write-Host "Downloading drivers..."

Invoke-WebRequest -Uri "https://ftp.hp.com/pub/softpaq/sp157001-157500/sp157284.exe" -OutFile "C:\Drivers\sp157284.exe"
Invoke-WebRequest -Uri "https://ftp.hp.com/pub/softpaq/sp155501-156000/sp155883.exe" -OutFile "C:\Drivers\sp155883.exe"
Invoke-WebRequest -Uri "https://ftp.hp.com/pub/softpaq/sp153501-154000/sp153667.exe" -OutFile "C:\Drivers\sp153667.exe"
Invoke-WebRequest -Uri "https://ftp.hp.com/pub/softpaq/sp158001-158500/sp158031.exe" -OutFile "C:\Drivers\sp158031.exe"

# --- התקנת דרייברים (silent) ---
Write-Host "Installing driver sp157284.exe..."
Start-Process -FilePath "C:\Drivers\sp157284.exe" -ArgumentList "/s" -Wait

Write-Host "Installing driver sp155883.exe..."
Start-Process -FilePath "C:\Drivers\sp155883.exe" -ArgumentList "/s" -Wait

Write-Host "Installing driver sp153667.exe..."
Start-Process -FilePath "C:\Drivers\sp153667.exe" -ArgumentList "/s" -Wait

Write-Host "Installing driver sp158031.exe..."
Start-Process -FilePath "C:\Drivers\sp158031.exe" -ArgumentList "/s" -Wait

Write-Host "All drivers installed successfully."

# --- הודעה על ריסטארט וביצוע ---
Write-Host "The system will restart in 10 seconds to apply the driver changes..."
Start-Sleep -Seconds 10
Restart-Computer
