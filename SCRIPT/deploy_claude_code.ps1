<#
.SYNOPSIS
  Deploy Career Mentor → Claude Code CLI 格式
  保護：Claude_Code_DEPLOY-GUIDE.md、SKILL.md
  清除：output/（完整重建）
#>

$root        = Split-Path $PSScriptRoot -Parent
$platform    = "Claude_Code"
$outputDir   = "$root\DEPLOYMENT\$platform\output"
$refsDir     = "$outputDir\references"
$mainFiles   = "$root\MainFiles"
$sourceSkill = "$root\DEPLOYMENT\$platform\SKILL.md"

Write-Host ""
Write-Host "═══════════════════════════════════════════" -ForegroundColor DarkCyan
Write-Host "  Deploy Target: Claude Code CLI" -ForegroundColor Cyan
Write-Host "═══════════════════════════════════════════" -ForegroundColor DarkCyan

# 1. 清除 output/
Write-Host "`n[1/3] 清除 output/ ..." -NoNewline
if (Test-Path $outputDir) { Remove-Item -Recurse -Force $outputDir }
New-Item -ItemType Directory -Path $refsDir -Force | Out-Null
Write-Host " 完成" -ForegroundColor Green

# 2. 複製 SKILL.md
Write-Host "[2/3] 複製 SKILL.md ..." -NoNewline
Copy-Item $sourceSkill "$outputDir\SKILL.md" -Force
Write-Host " 完成" -ForegroundColor Green

# 3. 複製 MainFiles → references/
$mdCount = (Get-ChildItem $mainFiles -Filter "*.md").Count
Write-Host "[3/3] 複製 MainFiles → references/ ($mdCount 個文件) ..." -NoNewline
Copy-Item "$mainFiles\*.md" $refsDir -Force
Write-Host " 完成" -ForegroundColor Green

Write-Host ""
Write-Host "✅  Claude Code 部署完成" -ForegroundColor Green
Write-Host "    輸出路徑：$outputDir"
Write-Host ""
Write-Host "安裝指令："
Write-Host "  mkdir -p ~/.claude/skills/career-mentor/references" -ForegroundColor DarkGray
Write-Host "  cp output/SKILL.md ~/.claude/skills/career-mentor/" -ForegroundColor DarkGray
Write-Host "  cp output/references/*.md ~/.claude/skills/career-mentor/references/" -ForegroundColor DarkGray
Write-Host ""
