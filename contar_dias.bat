@echo off
:inicio
cls
echo Digite a data inicial (ex: 2025-02-05T00:00:00.000Z): 
set /p dtInicial=
echo Digite a data final   (ex: 2025-05-05T23:59:59.999Z): 
set /p dtFinal=

powershell -Command ^
  "$fmt='yyyy-MM-ddTHH:mm:ss.fff';" ^
  "$ini=[datetime]::ParseExact('%dtInicial%'.TrimEnd('Z'), $fmt, $null);" ^
  "$fim=[datetime]::ParseExact('%dtFinal%'.TrimEnd('Z'), $fmt, $null);" ^
  "$diff=$fim - $ini;" ^
  "Write-Host ('Diferenca: {0} dias, {1} horas, {2} minutos e {3} segundos' -f $diff.Days, $diff.Hours, $diff.Minutes, $diff.Seconds)"

echo.
set /p opcao=Deseja realizar um novo calculo? (S/N): 
if /I "%opcao%"=="S" goto inicio
if /I "%opcao%"=="N" exit
goto inicio
