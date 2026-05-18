# Switch the active profile README theme.
#
# Usage:
#   .\switch-theme.ps1 batman
#   .\switch-theme.ps1 clean
#
# After running, commit and push:
#   git commit -am "Switch theme" ; git push

param(
    [Parameter(Mandatory = $true)]
    [ValidateSet("batman", "clean")]
    [string]$Theme
)

$source = Join-Path $PSScriptRoot "themes\$Theme.md"
$target = Join-Path $PSScriptRoot "README.md"

if (-not (Test-Path $source)) {
    Write-Host "Theme file not found: $source" -ForegroundColor Red
    exit 1
}

Copy-Item -Path $source -Destination $target -Force
Write-Host "Switched README.md to '$Theme' theme." -ForegroundColor Green
Write-Host "Next: git commit -am `"Switch to $Theme theme`" ; git push" -ForegroundColor Yellow
