<#
.SYNOPSIS
  Career Mentor — 互動式部署入口
  呼叫方式：在 Claude Code 中請 AI 執行此腳本，或直接在終端機執行。
#>

$root = Split-Path $PSScriptRoot -Parent

Write-Host ""
Write-Host "╔══════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║      Career Mentor — Deploy 選擇器       ║" -ForegroundColor Cyan
Write-Host "╚══════════════════════════════════════════╝" -ForegroundColor Cyan
Write-Host ""
Write-Host "  請選擇要部署的版本："
Write-Host ""
Write-Host "  [1]  Claude Code             (SKILL.md + references/)" -ForegroundColor Yellow
Write-Host "  [2]  Claude.ai Web           (多文件 + career-mentor.zip 打包)" -ForegroundColor Yellow
Write-Host ""

$choice = Read-Host "輸入數字 (1-2)"

switch ($choice) {
    "1" { & "$PSScriptRoot\deploy_claude_code.ps1" }
    "2" { & "$PSScriptRoot\deploy_claude_web.ps1"  }
    default {
        Write-Host ""
        Write-Host "❌  無效選擇「$choice」，請輸入 1–2。" -ForegroundColor Red
        Write-Host ""
    }
}
