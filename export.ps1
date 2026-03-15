param(
    [string]$OutputPath
)

$ErrorActionPreference = "Stop"

$PackageRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
if ([string]::IsNullOrWhiteSpace($OutputPath)) {
    $timestamp = Get-Date -Format "yyyyMMdd-HHmmss"
    $OutputPath = Join-Path $PackageRoot "..\codex-solo-kit-$timestamp.zip"
}

$resolvedOutput = [System.IO.Path]::GetFullPath($OutputPath)
if (Test-Path $resolvedOutput) {
    Remove-Item $resolvedOutput -Force
}

$pathsToArchive = Get-ChildItem $PackageRoot -Force | Where-Object { $_.Name -ne 'exported' } | Select-Object -ExpandProperty FullName
Compress-Archive -Path $pathsToArchive -DestinationPath $resolvedOutput
Write-Output "Exported package to $resolvedOutput"
