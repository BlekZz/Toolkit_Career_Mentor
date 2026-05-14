<#
.SYNOPSIS
  Deploy Career Mentor → Claude.ai Web 格式（多文件 + .skill 打包）
  保護：Claude_Web_DEPLOY-GUIDE.md、SKILL.md、career-mentor-v1.skill（源）
  清除：output/（完整重建）並重新打包 .skill
#>

$root        = Split-Path $PSScriptRoot -Parent
$platform    = "Claude_Web"
$outputDir   = "$root\DEPLOYMENT\$platform\output"
$refsDir     = "$outputDir\references"
$mainFiles   = "$root\MainFiles"
$sourceSkill = "$root\DEPLOYMENT\$platform\SKILL.md"
$skillPkg    = "$root\DEPLOYMENT\$platform\career-mentor-v1.skill"

Write-Host ""
Write-Host "═══════════════════════════════════════════" -ForegroundColor DarkCyan
Write-Host "  Deploy Target: Claude.ai Web" -ForegroundColor Cyan
Write-Host "═══════════════════════════════════════════" -ForegroundColor DarkCyan

# 1. 清除 output/
Write-Host "`n[1/4] 清除 output/ ..." -NoNewline
if (Test-Path $outputDir) { Remove-Item -Recurse -Force $outputDir }
New-Item -ItemType Directory -Path $refsDir -Force | Out-Null
Write-Host " 完成" -ForegroundColor Green

# 2. 複製 SKILL.md
Write-Host "[2/4] 複製 SKILL.md ..." -NoNewline
Copy-Item $sourceSkill "$outputDir\SKILL.md" -Force
Write-Host " 完成" -ForegroundColor Green

# 3. 複製 MainFiles → references/
$mdCount = (Get-ChildItem $mainFiles -Filter "*.md").Count
Write-Host "[3/4] 複製 MainFiles → references/ ($mdCount 個文件) ..." -NoNewline
Copy-Item "$mainFiles\*.md" $refsDir -Force
Write-Host " 完成" -ForegroundColor Green

# 4. 打包 .skill（zip → 重命名）
Write-Host "[4/4] 重新打包 career-mentor-v1.skill ..." -NoNewline
$tmpZip = "$root\DEPLOYMENT\$platform\_career-mentor-v1.zip"
if (Test-Path $tmpZip)   { Remove-Item $tmpZip -Force }
if (Test-Path $skillPkg) { Remove-Item $skillPkg -Force }
Compress-Archive -Path "$outputDir\SKILL.md", "$outputDir\references" -DestinationPath $tmpZip -Force
Rename-Item $tmpZip $skillPkg
Write-Host " 完成" -ForegroundColor Green

Write-Host ""
Write-Host "✅  Claude Web 部署完成" -ForegroundColor Green
Write-Host "    多文件路徑 ：$outputDir"
Write-Host "    打包檔案   ：$skillPkg"
Write-Host ""
Write-Host "部署方式（擇一）："
Write-Host "  方式 A — Project 多文件：將 output/references/instructions.md 貼入 Project Instructions，其餘 9 個文件上傳至 Knowledge" -ForegroundColor DarkGray
Write-Host "  方式 B — 單一文件快貼 ：直接使用 career-mentor-v1.skill 壓縮包中的合併文件" -ForegroundColor DarkGray
Write-Host ""
