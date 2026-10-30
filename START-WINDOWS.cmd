@echo off
cd /d "%~dp0"
where node >nul 2>&1
if errorlevel 1 (
  echo Node.js is not installed on this computer.
  echo Install Node.js 20 or newer from https://nodejs.org/ and run this again.
  pause
  exit /b 1
)
echo Starting Orbit Tutor at http://localhost:3001
start "" http://localhost:3001
node server\index.js
pause
