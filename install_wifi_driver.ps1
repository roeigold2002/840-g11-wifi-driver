# --- יצירת תיקיות זמניות ---
New-Item -Path "C:\Temp" -ItemType Directory -Force | Out-Null
New-Item -Path "C:\Drivers" -ItemType Directory -Force | Out-Null

# --- זיהוי דגם המחשב ---
$model = (Get-CimInstance Win32_ComputerSystem).Model.Trim()
Write-Host "Detected model: $model"

# --- בדיקה ודגם מתאים ---
if ($model -eq "HP EliteBook 840 G11") {

    Write-Host "HP EliteBook 840 G11 detected. Proceeding with driver installation..."

    # --- קישור ישיר לדרייבר Wi-Fi ---
    $driverUrl = "https://ftp.hp.com/pub/softpaq/sp157001-157500/sp157284.exe"
    $driverExe = "C:\Temp\sp157284.exe"

    # --- הורדה עם curl ---
    Write-Host "Downloading Wi-Fi driver from $driverUrl"
    curl -L -o $driverExe $driverUrl

    # --- הרצת קובץ ההתקנה של HP (תומך בפרמטר שקט /silent) ---
    Write-Host "Installing Wi-Fi driver..."
    Start-Process -FilePath $driverExe -ArgumentList "/silent" -Wait

    Write-Host "Driver installation complete."

} else {
    Write-Host "This script only supports HP EliteBook 840 G11. Exiting."
}
