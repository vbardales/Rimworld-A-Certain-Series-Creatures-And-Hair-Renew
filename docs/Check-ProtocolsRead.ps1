<#
.SYNOPSIS
  Says which of the documents listed in docs/PROTOCOLS-READ.md have moved since they were read.
.DESCRIPTION
  Reads the table rows of PROTOCOLS-READ.md of the form  | `path` | ... | `sha` | ...  , recomputes the SHA-256 (first 12
  hex) of each file, and prints OK, CHANGED or MISSING. A path is relative to the collection root (the folder above the
  mod), except the mod's own files, which the note writes with the mod folder's name in front. Read-only.
.EXAMPLE
  powershell -NoProfile -ExecutionPolicy Bypass -File docs/Check-ProtocolsRead.ps1
#>
$note = Join-Path $PSScriptRoot 'PROTOCOLS-READ.md'
$root = Split-Path (Split-Path $PSScriptRoot -Parent) -Parent    # the collection root: docs\ -> mod folder -> root
$changed = 0
foreach ($line in [IO.File]::ReadAllLines($note)) {
    if ($line -notmatch '^\|\s*`(?<path>[^`]+)`.*?`(?<sha>[0-9a-f]{12})`') { continue }
    $file = Join-Path $root ($Matches.path -replace '/', '\')
    if (-not (Test-Path -LiteralPath $file)) { Write-Host "MISSING  $($Matches.path)" -ForegroundColor Red; $changed++; continue }
    $now = (Get-FileHash -LiteralPath $file -Algorithm SHA256).Hash.Substring(0, 12).ToLower()
    if ($now -eq $Matches.sha) { Write-Host "OK       $($Matches.path)" }
    else { Write-Host "CHANGED  $($Matches.path)  (read $($Matches.sha), now $now)" -ForegroundColor Yellow; $changed++ }
}
if ($changed) { Write-Host "$changed document(s) to read again."; exit 1 } else { Write-Host 'Nothing moved since the note.' }
