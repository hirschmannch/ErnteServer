@echo off
setlocal
net session >nul 2>&1
if not "%errorlevel%"=="0" (
  powershell -NoProfile -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
  exit /b
)
if not exist "C:\ErnteServer\launcher" (
  echo FEHLER: Der ErnteServer Launcher ist nicht installiert.
  pause
  exit /b 1
)
>"C:\ErnteServer\launcher\update_config.json" echo {
>>"C:\ErnteServer\launcher\update_config.json" echo   "manifest_url": "https://raw.githubusercontent.com/hirschmannch/ErnteServer/main/update/manifest.json",
>>"C:\ErnteServer\launcher\update_config.json" echo   "channel": "stable"
>>"C:\ErnteServer\launcher\update_config.json" echo }
echo GitHub-Updates wurden aktiviert.
start "" "C:\ErnteServer\launcher\ERNTE_LAUNCHER_STARTEN.bat"
timeout /t 3 /nobreak >nul
