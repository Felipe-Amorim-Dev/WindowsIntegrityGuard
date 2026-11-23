$ErrorActionPreference = "Stop"

$InstallerRoot = $PSScriptRoot
$Root = Split-Path -Parent $InstallerRoot

$ServiceProject = Join-Path $Root "service\WindowsIntegrityGuard\WindowsIntegrityGuard.Service\WindowsIntegrityGuard.Service.csproj"
$UiProject = Join-Path $Root "ui\WindowsIntegrityGuard.UI\WindowsIntegrityGuard.UI\WindowsIntegrityGuard.UI.csproj"

$PublishRoot = Join-Path $InstallerRoot "publish"
$ServicePublish = Join-Path $PublishRoot "service"
$UiPublish = Join-Path $PublishRoot "ui"

Write-Host ""
Write-Host "=========================================="
Write-Host " Windows Integrity Guard - Build Installer"
Write-Host "=========================================="
Write-Host ""

if (Test-Path $PublishRoot)
{
    Remove-Item $PublishRoot -Recurse -Force
}

New-Item -ItemType Directory -Path $ServicePublish -Force | Out-Null
New-Item -ItemType Directory -Path $UiPublish -Force | Out-Null

Write-Host "[1/2] Publicando Service..."
Write-Host "Projeto: $ServiceProject"

dotnet publish $ServiceProject -c Release -r win-x64 --self-contained false -o $ServicePublish

if ($LASTEXITCODE -ne 0)
{
    throw "Falha ao publicar o Service."
}

Write-Host ""
Write-Host "[2/2] Publicando UI..."
Write-Host "Projeto: $UiProject"

dotnet publish $UiProject -c Release -r win-x64 --self-contained false -o $UiPublish

if ($LASTEXITCODE -ne 0)
{
    throw "Falha ao publicar a UI."
}

Write-Host ""
Write-Host "=========================================="
Write-Host " Publicacao concluida!"
Write-Host "=========================================="
Write-Host ""
Write-Host "Service:"
Write-Host $ServicePublish
Write-Host ""
Write-Host "UI:"
Write-Host $UiPublish
Write-Host ""