param(
    [switch]$Force
)

$ErrorActionPreference = "Stop"

$PackageRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$UserHome = $env:USERPROFILE
$CodexDir = Join-Path $UserHome ".codex"
$SkillsDir = Join-Path $CodexDir "skills"
$WorkflowsDir = Join-Path $CodexDir "workflows"
$StateDir = Join-Path $CodexDir ".codex-solo-kit"
$BackupDir = Join-Path $StateDir "backup"
$ManifestPath = Join-Path $StateDir "manifest.json"
$AgentsPath = Join-Path $CodexDir "AGENTS.md"
$AgentsBackupPath = Join-Path $BackupDir "AGENTS.before-install.md"
$BeginMarker = "# >>> codex-solo-kit >>>"
$EndMarker = "# <<< codex-solo-kit <<<"

function Ensure-Dir {
    param([string]$Path)
    if (!(Test-Path $Path)) {
        New-Item -ItemType Directory -Path $Path -Force | Out-Null
    }
}

function Copy-Tree {
    param(
        [string]$Source,
        [string]$Destination,
        [System.Collections.Generic.List[string]]$InstalledFiles
    )

    Ensure-Dir $Destination
    Get-ChildItem -Path $Source -Recurse -File | ForEach-Object {
        $relative = $_.FullName.Substring($Source.Length).TrimStart([char[]]@('\','/'))
        $target = Join-Path $Destination $relative
        Ensure-Dir (Split-Path $target -Parent)
        Copy-Item $_.FullName $target -Force
        $InstalledFiles.Add($target) | Out-Null
    }
}

function Backup-ExistingTarget {
    param(
        [string]$TargetPath,
        [string]$BackupRoot
    )

    Ensure-Dir $BackupRoot
    if (Test-Path $TargetPath) {
        $leaf = Split-Path $TargetPath -Leaf
        $backupTarget = Join-Path $BackupRoot $leaf
        if (!(Test-Path $backupTarget)) {
            Copy-Item $TargetPath $backupTarget -Recurse -Force
        }
    }
}

function Update-Agents {
    Ensure-Dir $CodexDir
    Ensure-Dir $BackupDir

    if ((Test-Path $AgentsPath) -and !(Test-Path $AgentsBackupPath)) {
        Copy-Item $AgentsPath $AgentsBackupPath -Force
    }

    $existing = ""
    if (Test-Path $AgentsPath) {
        $existing = Get-Content $AgentsPath -Raw
    }

    $managed = Get-Content (Join-Path $PackageRoot "AGENTS.global.md") -Raw
    $block = @(
        $BeginMarker
        $managed.TrimEnd()
        $EndMarker
        ""
    ) -join "`r`n"

    $pattern = [regex]::Escape($BeginMarker) + "[\s\S]*?" + [regex]::Escape($EndMarker)
    if ($existing -match $pattern) {
        $updated = [regex]::Replace($existing, $pattern, [System.Text.RegularExpressions.MatchEvaluator]{ param($m) $block.TrimEnd() })
    } elseif ([string]::IsNullOrWhiteSpace($existing)) {
        $updated = $block
    } else {
        $updated = $existing.TrimEnd() + "`r`n`r`n" + $block
    }

    Set-Content -Path $AgentsPath -Value $updated -Encoding UTF8
}

Ensure-Dir $CodexDir
Ensure-Dir $SkillsDir
Ensure-Dir $WorkflowsDir
Ensure-Dir $StateDir
Ensure-Dir $BackupDir

$installedFiles = New-Object 'System.Collections.Generic.List[string]'
$backedUpTargets = New-Object 'System.Collections.Generic.List[string]'

$skillRoot = Join-Path $PackageRoot "skills"
Get-ChildItem $skillRoot -Directory | ForEach-Object {
    $targetDir = Join-Path $SkillsDir $_.Name
    if (Test-Path $targetDir) {
        Backup-ExistingTarget -TargetPath $targetDir -BackupRoot (Join-Path $BackupDir "skills")
        $backedUpTargets.Add($targetDir) | Out-Null
    }
    Copy-Tree -Source $_.FullName -Destination $targetDir -InstalledFiles $installedFiles
}

$workflowRoot = Join-Path $PackageRoot "workflows"
Get-ChildItem $workflowRoot -File | ForEach-Object {
    $target = Join-Path $WorkflowsDir $_.Name
    if (Test-Path $target) {
        Backup-ExistingTarget -TargetPath $target -BackupRoot (Join-Path $BackupDir "workflows")
        $backedUpTargets.Add($target) | Out-Null
    }
    Copy-Item $_.FullName $target -Force
    $installedFiles.Add($target) | Out-Null
}

Update-Agents

$manifest = [ordered]@{
    package = "codex-solo-kit"
    installedAt = (Get-Date).ToString("o")
    packageRoot = $PackageRoot
    stateDir = $StateDir
    installedFiles = $installedFiles
    backedUpTargets = $backedUpTargets
    agentsPath = $AgentsPath
    agentsBackupPath = $AgentsBackupPath
    beginMarker = $BeginMarker
    endMarker = $EndMarker
}

$manifest | ConvertTo-Json -Depth 6 | Set-Content -Path $ManifestPath -Encoding UTF8

Write-Output "Installed codex-solo-kit."
Write-Output "State: $StateDir"
Write-Output "Manifest: $ManifestPath"


