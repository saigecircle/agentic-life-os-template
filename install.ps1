param(
  [string]$Destination = "",
  [switch]$Force
)

$RepoOwner = if ($env:REPO_OWNER) { $env:REPO_OWNER } else { "saigecircle" }
$RepoName = if ($env:REPO_NAME) { $env:REPO_NAME } else { "agentic-life-os-template" }
$Branch = if ($env:BRANCH) { $env:BRANCH } else { "main" }
$DefaultDestination = Join-Path $HOME "Documents/LifeOS"

if ([string]::IsNullOrWhiteSpace($Destination)) {
  $inputPath = Read-Host "Where should the Life OS vault be installed? [$DefaultDestination]"
  if ([string]::IsNullOrWhiteSpace($inputPath)) { $Destination = $DefaultDestination } else { $Destination = $inputPath }
}

$Destination = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($Destination)
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$LocalVault = Join-Path $ScriptDir "vault"
$TempDir = $null

if (Test-Path $LocalVault) {
  $SourceVault = $LocalVault
} else {
  $TempDir = New-Item -ItemType Directory -Path (Join-Path ([System.IO.Path]::GetTempPath()) ([System.Guid]::NewGuid().ToString()))
  $ZipUrl = "https://github.com/$RepoOwner/$RepoName/archive/refs/heads/$Branch.zip"
  $ZipPath = Join-Path $TempDir "template.zip"
  Write-Host "Downloading template from $ZipUrl"
  Invoke-WebRequest -Uri $ZipUrl -OutFile $ZipPath
  Expand-Archive -Path $ZipPath -DestinationPath $TempDir
  $SourceVault = Join-Path $TempDir "$RepoName-$Branch/vault"
}

if (!(Test-Path $SourceVault)) {
  throw "Could not find vault template at: $SourceVault"
}

if ((Test-Path $Destination) -and ((Get-ChildItem -LiteralPath $Destination -Force | Select-Object -First 1) -ne $null) -and (-not $Force)) {
  throw "Destination exists and is not empty: $Destination. Choose an empty folder, or rerun with -Force to merge/overwrite."
}

New-Item -ItemType Directory -Path $Destination -Force | Out-Null
Copy-Item -Path (Join-Path $SourceVault "*") -Destination $Destination -Recurse -Force
Get-ChildItem -LiteralPath $Destination -Recurse -Force -Filter ".gitkeep" | Remove-Item -Force

Write-Host ""
Write-Host "Life OS starter vault installed at:"
Write-Host "  $Destination"
Write-Host ""
Write-Host "Next steps:"
Write-Host "  1. Open this folder in Obsidian, VS Code, Cursor, or your Markdown editor."
Write-Host "  2. Read README.md."
Write-Host "  3. Fill in 06 Meta/About Me.md."
Write-Host "  4. Create your first project in 01 Projects/."
Write-Host "  5. Drop one messy note into 00 Inbox/ and ask an AI agent to help file it."
