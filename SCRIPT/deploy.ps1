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
Write-Host "  [1]  Claude Code CLI         (SKILL.md + references/)" -ForegroundColor Yellow
Write-Host "  [2]  Claude.ai Web           (多文件 + .skill 打包)"   -ForegroundColor Yellow
Write-Host "  [3]  Gemini Gems             (平鋪 10 個文件)"          -ForegroundColor Yellow
Write-Host "  [4]  ChatGPT GPTs            (平鋪 10 個文件)"          -ForegroundColor Yellow
Write-Host ""

$choice = Read-Host "輸入數字 (1-4)"

switch ($choice) {
    "1" { & "$PSScriptRoot\deploy_claude_code.ps1" }
    "2" { & "$PSScriptRoot\deploy_claude_web.ps1"  }
    "3" { & "$PSScriptRoot\deploy_gemini_gem.ps1"  }
    "4" { & "$PSScriptRoot\deploy_gpts.ps1"        }
    default {
        Write-Host ""
        Write-Host "❌  無效選擇「$choice」，請輸入 1–4。" -ForegroundColor Red
        Write-Host ""
    }
}
