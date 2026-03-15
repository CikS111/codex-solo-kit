param(
    [switch]$Rollback
)

$ErrorActionPreference = "Stop"

$UserHome = $env:USERPROFILE
$CodexDir = Join-Path $UserHome ".codex"
$StateDir = Join-Path $CodexDir ".codex-solo-kit"
$ManifestPath = Join-Path $StateDir "manifest.json"

if (!(Test-Path $ManifestPath)) {
    throw "No manifest found at $ManifestPath"
}

$manifest = Get-Content $ManifestPath -Raw | ConvertFrom-Json

foreach ($file in $manifest.installedFiles) {
    if (Test-Path $file) {
        Remove-Item $file -Force
    }
}

$skillDirs = @()
foreach ($file in $manifest.installedFiles) {
    if ($file -like "*\\.codex\\skills\\*") {
        $dir = Split-Path $file -Parent
        if ($skillDirs -notcontains $dir) {
            $skillDirs += $dir
        }
    }
}

$skillDirs | Sort-Object Length -Descending | ForEach-Object {
    if (Test-Path $_) {
        $child = Get-ChildItem $_ -Force | Select-Object -First 1
        if ($null -eq $child) {
            Remove-Item $_ -Force
        }
    }
}

$agentsPath = $manifest.agentsPath
if (Test-Path $agentsPath) {
    if ($Rollback -and (Test-Path $manifest.agentsBackupPath)) {
        Copy-Item $manifest.agentsBackupPath $agentsPath -Force
    } else {
        $content = Get-Content $agentsPath -Raw
        $pattern = [regex]::Escape($manifest.beginMarker) + "[\s\S]*?" + [regex]::Escape($manifest.endMarker)
        $updated = [regex]::Replace($content, $pattern, "").Trim()
        if ([string]::IsNullOrWhiteSpace($updated)) {
            Remove-Item $agentsPath -Force
        } else {
            Set-Content -Path $agentsPath -Value ($updated + "`r`n") -Encoding UTF8
        }
    }
}

if ($Rollback) {
    foreach ($target in $manifest.backedUpTargets) {
        $leaf = Split-Path $target -Leaf
        if ($target -like "*\\.codex\\skills\\*") {
            $backup = Join-Path (Join-Path $StateDir "backup\\skills") $leaf
        } else {
            $backup = Join-Path (Join-Path $StateDir "backup\\workflows") $leaf
        }
        if (Test-Path $backup) {
            Copy-Item $backup $target -Recurse -Force
        }
    }
}

Write-Output "Uninstalled codex-solo-kit."
if ($Rollback) {
    Write-Output "Rollback restored backed up targets where available."
}
