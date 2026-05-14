<#
.SYNOPSIS
  Deploy Career Mentor → Gemini Gem 格式（平鋪 10 個文件）
  保護：Gemini_DEPLOY-GUIDE.md
  清除：output/（完整重建）
#>

$root      = Split-Path $PSScriptRoot -Parent
$platform  = "Gemini_Gem"
$outputDir = "$root\DEPLOYMENT\$platform\output"
$mainFiles = "$root\MainFiles"

Write-Host ""
Write-Host "═══════════════════════════════════════════" -ForegroundColor DarkCyan
Write-Host "  Deploy Target: Gemini Gem" -ForegroundColor Cyan
Write-Host "═══════════════════════════════════════════" -ForegroundColor DarkCyan

# 1. 清除 output/
Write-Host "`n[1/2] 清除 output/ ..." -NoNewline
if (Test-Path $outputDir) { Remove-Item -Recurse -Force $outputDir }
New-Item -ItemType Directory -Path $outputDir -Force | Out-Null
Write-Host " 完成" -ForegroundColor Green

# 2. 複製 MainFiles → output/（平鋪，無子資料夾）
$mdCount = (Get-ChildItem $mainFiles -Filter "*.md").Count
Write-Host "[2/2] 複製 MainFiles → output/ ($mdCount 個文件，平鋪) ..." -NoNewline
Copy-Item "$mainFiles\*.md" $outputDir -Force
Write-Host " 完成" -ForegroundColor Green

Write-Host ""
Write-Host "✅  Gemini Gem 部署完成" -ForegroundColor Green
Write-Host "    輸出路徑：$outputDir"
Write-Host ""
Write-Host "部署提示：將 output/instructions.md 貼入 Gem Instructions，其餘 9 個文件上傳至 Knowledge" -ForegroundColor DarkGray
Write-Host ""
