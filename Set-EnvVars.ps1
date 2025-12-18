$FileData = Get-Content -Path '.\.env' | Out-String

$ConfigHash = $FileData | ConvertFrom-StringData

foreach ($EnvVarName in $ConfigHash.Keys) {
    $Value = $ConfigHash[$EnvVarName] -replace '^"|"$', ''
    Set-Item -Path Env:$EnvVarName -Value $Value

    Write-Host "Set $EnvVarName" -ForegroundColor Green
}
