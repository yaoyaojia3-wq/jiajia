@echo off
chcp 65001 >nul
setlocal
cd /d "%~dp0"
echo.
echo 正在启动局域网网页服务...
echo 请保持此窗口开启。
echo.
set "CODEX_PY=%USERPROFILE%\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe"
if exist "%CODEX_PY%" (
  "%CODEX_PY%" -m http.server 8765 --bind 0.0.0.0
) else (
  where py >nul 2>nul
  if %errorlevel%==0 (
    py -m http.server 8765 --bind 0.0.0.0
  ) else (
    python -m http.server 8765 --bind 0.0.0.0
  )
)
pause
