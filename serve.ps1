param(
    [int]$Port = 8000
)

# Serve static files from the current directory using the highest-available method:
# 1) Python 3 - http.server
# 2) Python 2 - SimpleHTTPServer
# 3) Node `npx http-server` if available

Write-Host "Starting local server in:`n  Path: $(Get-Location)`n  Port: $Port`n"

# Try Python 3
if (Get-Command python -ErrorAction SilentlyContinue) {
    $pyVersion = & python -c "import sys; print(sys.version_info[0])" 2>$null
    if ($pyVersion -eq '3') {
        Write-Host "Using Python 3 http.server..."
        python -m http.server $Port
        exit $LASTEXITCODE
    }
    elseif ($pyVersion -eq '2') {
        Write-Host "Using Python 2 SimpleHTTPServer..."
        python -m SimpleHTTPServer $Port
        exit $LASTEXITCODE
    }
}

# Try `npx http-server`
if (Get-Command npx -ErrorAction SilentlyContinue) {
    Write-Host "Using npx http-server... (requires http-server package or will fetch it temporarily)"
    npx http-server -p $Port
    exit $LASTEXITCODE
}

Write-Warning "Nenhum servidor suportado encontrado. Instale Python (recomendado) ou Node.js + http-server."
exit 1
