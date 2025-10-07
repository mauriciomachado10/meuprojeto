@echo off
set PORT=8000
if not "%1"=="" set PORT=%1

echo Starting local server in %CD% on port %PORT%

:: Try python
where python >nul 2>&1
if %ERRORLEVEL%==0 (
    for /f "usebackq tokens=1" %%v in (`python -c "import sys;print(sys.version_info[0])"`) do set PYVER=%%v
    if "%PYVER%"=="3" (
        echo Using Python 3 http.server...
        python -m http.server %PORT%
        goto :eof
    ) else (
        echo Using Python 2 SimpleHTTPServer...
        python -m SimpleHTTPServer %PORT%
        goto :eof
    )
)

:: Try npx
where npx >nul 2>&1
if %ERRORLEVEL%==0 (
    echo Using npx http-server...
    npx http-server -p %PORT%
    goto :eof
)

echo No supported server found. Install Python or Node.js with http-server.
exit /b 1
