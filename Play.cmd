@echo off
cd /d "%~dp0"
node tools\start-game.cjs
if errorlevel 1 pause
