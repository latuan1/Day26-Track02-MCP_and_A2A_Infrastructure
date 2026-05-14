@echo off

echo Starting Registry service on port 10000...
start "Registry" cmd /k "uv run python -m registry"
timeout /t 2 /nobreak >nul

echo Starting Tax Agent on port 10102...
start "Tax Agent" cmd /k "uv run python -m tax_agent"

echo Starting Compliance Agent on port 10103...
start "Compliance Agent" cmd /k "uv run python -m compliance_agent"
timeout /t 3 /nobreak >nul

echo Starting Law Agent on port 10101...
start "Law Agent" cmd /k "uv run python -m law_agent"
timeout /t 3 /nobreak >nul

echo Starting Customer Agent on port 10100...
start "Customer Agent" cmd /k "uv run python -m customer_agent"

echo.
echo All services started.
pause