@echo off
cd /d "%~dp0"
node tools\build-recovered.cjs patches/sp2-gpu.as build/stunt-pilot-gpu.swf
if errorlevel 1 goto failed
node tools\package-website.cjs
if errorlevel 1 goto failed
echo Build complete. Upload build\website-upload or use build\stunt-pilot-website.zip.
pause
exit /b 0
:failed
echo Build failed. See the error above.
pause
exit /b 1
