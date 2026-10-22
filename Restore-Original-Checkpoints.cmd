@echo off
cd /d "%~dp0"
node tools\select-checkpoint-texture.cjs original
pause
