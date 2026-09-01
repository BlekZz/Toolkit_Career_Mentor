<#
.SYNOPSIS
  Deploy Career Mentor → Claude Code CLI 格式（skill v2）
  源：MainFiles\SKILL.md（跨平台通用）+ MainFiles\*.md → references/
  保護：Claude_Code_DEPLOY-GUIDE.md
  清除：output/（完整重建）
#>

$root      = Split-Path $PSScriptRoot -Parent
$platform  = "Claude_Code"
$outputDir = "$root\DEPLOYMENT\$platform\output"
$refsDir   = "$outputDir\references"
$mainFiles = "$root\MainFiles"

Write-Host ""
Write-Host "═══════════════════════════════════════════" -ForegroundColor DarkCyan
Write-Host "  Deploy Target: Claude Code CLI" -ForegroundColor Cyan
Write-Host "═══════════════════════════════════════════" -ForegroundColor DarkCyan

# 1. 清除 output/
Write-Host "`n[1/3] 清除 output/ ..." -NoNewline
if (Test-Path $outputDir) { Remove-Item -Recurse -Force $outputDir }
New-Item -ItemType Directory -Path $refsDir -Force | Out-Null
Write-Host " 完成" -ForegroundColor Green

# 2. 複製 SKILL.md（源 = MainFiles，v2 起跨平台共用一份）
Write-Host "[2/3] 複製 SKILL.md ..." -NoNewline
Copy-Item "$mainFiles\SKILL.md" "$outputDir\SKILL.md" -Force
Write-Host " 完成" -ForegroundColor Green

# 3. 複製 MainFiles → references/（排除 SKILL.md 本身）
$refFiles = Get-ChildItem $mainFiles -Filter "*.md" | Where-Object { $_.Name -ne "SKILL.md" }
Write-Host "[3/3] 複製 MainFiles → references/ ($($refFiles.Count) 個文件) ..." -NoNewline
$refFiles | Copy-Item -Destination $refsDir -Force
Write-Host " 完成" -ForegroundColor Green

Write-Host ""
Write-Host "✅  Claude Code 部署完成" -ForegroundColor Green
Write-Host "    輸出路徑：$outputDir"
Write-Host ""
Write-Host "安裝指令（專案級，建議）："
Write-Host "  Copy-Item output -Destination <project>\.claude\skills\career-mentor -Recurse" -ForegroundColor DarkGray
Write-Host "或全域："
Write-Host "  Copy-Item output -Destination ~\.claude\skills\career-mentor -Recurse" -ForegroundColor DarkGray
Write-Host ""
