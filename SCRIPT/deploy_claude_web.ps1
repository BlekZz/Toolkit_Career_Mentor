<#
.SYNOPSIS
  Deploy Career Mentor → Claude.ai Web 格式（skill v2：原生 Skills ZIP 上傳）
  源：MainFiles\SKILL.md + MainFiles\*.md → references/
  保護：Claude_Web_DEPLOY-GUIDE.md
  清除：output/（完整重建）並重新打包 career-mentor.zip
  ZIP 規格：skill 資料夾（career-mentor/）位於 ZIP 根部，資料夾名 = frontmatter name
#>

$root      = Split-Path $PSScriptRoot -Parent
$platform  = "Claude_Web"
$outputDir = "$root\DEPLOYMENT\$platform\output"
$refsDir   = "$outputDir\references"
$mainFiles = "$root\MainFiles"
$zipPath   = "$root\DEPLOYMENT\$platform\career-mentor.zip"

Write-Host ""
Write-Host "═══════════════════════════════════════════" -ForegroundColor DarkCyan
Write-Host "  Deploy Target: Claude.ai Web (native Skills)" -ForegroundColor Cyan
Write-Host "═══════════════════════════════════════════" -ForegroundColor DarkCyan

# 1. 清除 output/
Write-Host "`n[1/4] 清除 output/ ..." -NoNewline
if (Test-Path $outputDir) { Remove-Item -Recurse -Force $outputDir }
New-Item -ItemType Directory -Path $refsDir -Force | Out-Null
Write-Host " 完成" -ForegroundColor Green

# 2. 複製 SKILL.md（源 = MainFiles，v2 起跨平台共用一份）
Write-Host "[2/4] 複製 SKILL.md ..." -NoNewline
Copy-Item "$mainFiles\SKILL.md" "$outputDir\SKILL.md" -Force
Write-Host " 完成" -ForegroundColor Green

# 3. 複製 MainFiles → references/（排除 SKILL.md 本身）
$refFiles = Get-ChildItem $mainFiles -Filter "*.md" | Where-Object { $_.Name -ne "SKILL.md" }
Write-Host "[3/4] 複製 MainFiles → references/ ($($refFiles.Count) 個文件) ..." -NoNewline
$refFiles | Copy-Item -Destination $refsDir -Force
Write-Host " 完成" -ForegroundColor Green

# 4. 打包 career-mentor.zip（資料夾在 ZIP 根部）
Write-Host "[4/4] 打包 career-mentor.zip ..." -NoNewline
$staging = "$root\DEPLOYMENT\$platform\career-mentor"
if (Test-Path $staging) { Remove-Item -Recurse -Force $staging }
Copy-Item $outputDir $staging -Recurse
if (Test-Path $zipPath) { Remove-Item $zipPath -Force }
Compress-Archive -Path $staging -DestinationPath $zipPath -Force
Remove-Item -Recurse -Force $staging
Write-Host " 完成" -ForegroundColor Green

Write-Host ""
Write-Host "✅  Claude Web 部署完成" -ForegroundColor Green
Write-Host "    多文件路徑 ：$outputDir"
Write-Host "    上傳檔案   ：$zipPath"
Write-Host ""
Write-Host "上傳：claude.ai → Settings → Skills → Create skill → Upload a skill → 選 career-mentor.zip" -ForegroundColor DarkGray
Write-Host ""
