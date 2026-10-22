@echo off
cd /d "%~dp0"
node tools\package-website.cjs
if errorlevel 1 pause
