$ErrorActionPreference = "Stop"

$Root = Split-Path -Parent $PSScriptRoot

$ServiceProject = Join-Path $Root "service\WindowsIntegrityGuard\WindowsIntegrityGuard.Service\WindowsIntegrityGuard.Service.csproj"
$UiProject = Join-Path $Root "ui\WindowsIntegrityGuard.UI\WindowsIntegrityGuard.UI\WindowsIntegrityGuard.UI.csproj"

$PublishRoot = Join-Path $PSScriptRoot "publish"
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

Write-Host "[1/3] Publicando Service..."

dotnet publish $ServiceProject `
    -c Release `
    -r win-x64 `
    --self-contained false `
    -o $ServicePublish

if ($LASTEXITCODE -ne 0)
{
    throw "Falha ao publicar o Service."
}

Write-Host ""
Write-Host "[2/3] Publicando UI..."

dotnet publish $UiProject `
    -c Release `
    -r win-x64 `
    --self-contained false `
    -o $UiPublish

if ($LASTEXITCODE -ne 0)
{
    throw "Falha ao publicar a UI."
}

Write-Host ""
Write-Host "[3/3] Publicacao concluida."
Write-Host ""
Write-Host "Service: $ServicePublish"
Write-Host "UI:      $UiPublish"
Write-Host ""
Write-Host "Agora compile WindowsIntegrityGuard.iss usando o Inno Setup."