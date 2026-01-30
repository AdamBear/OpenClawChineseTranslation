# ============================================================
# OpenClaw 汉化发行版 - Windows 一键安装脚本
# 
# OpenClaw: 开源个人 AI 助手平台
# 官方网站: https://openclaw.ai/
# 汉化项目: https://openclaw.qt.cool/
#
# 武汉晴辰天下网络科技有限公司 | https://qingchencloud.com/
# ============================================================

$ErrorActionPreference = "Stop"

# 颜色输出
function Write-ColorOutput($ForegroundColor) {
    $fc = $host.UI.RawUI.ForegroundColor
    $host.UI.RawUI.ForegroundColor = $ForegroundColor
    if ($args) {
        Write-Output $args
    }
    $host.UI.RawUI.ForegroundColor = $fc
}

# Logo
function Show-Banner {
    Write-Host ""
    Write-Host "╔═══════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
    Write-Host "║                                                           ║" -ForegroundColor Cyan
    Write-Host "║     🦞 OpenClaw 汉化发行版                                ║" -ForegroundColor Cyan
    Write-Host "║        开源个人 AI 助手平台                              ║" -ForegroundColor Cyan
    Write-Host "║                                                           ║" -ForegroundColor Cyan
    Write-Host "║     武汉晴辰天下网络科技有限公司                          ║" -ForegroundColor Cyan
    Write-Host "║     https://openclaw.qt.cool/                             ║" -ForegroundColor Cyan
    Write-Host "║                                                           ║" -ForegroundColor Cyan
    Write-Host "╚═══════════════════════════════════════════════════════════╝" -ForegroundColor Cyan
    Write-Host ""
}

# 检查 Node.js
function Test-NodeVersion {
    try {
        $nodeVersion = node -v 2>$null
        if (-not $nodeVersion) {
            throw "Node.js not found"
        }
        
        $versionNum = $nodeVersion -replace 'v', ''
        $majorVersion = [int]($versionNum.Split('.')[0])
        
        if ($majorVersion -lt 22) {
            Write-Host "❌ Node.js 版本过低: $nodeVersion" -ForegroundColor Red
            Write-Host ""
            Write-Host "OpenClaw 需要 Node.js >= 22.12.0" -ForegroundColor Yellow
            Write-Host "请访问 https://nodejs.org/ 下载最新版本" -ForegroundColor Yellow
            Write-Host ""
            exit 1
        }
        
        Write-Host "✓ Node.js 版本: $nodeVersion" -ForegroundColor Green
        return $true
    }
    catch {
        Write-Host "❌ 未检测到 Node.js" -ForegroundColor Red
        Write-Host ""
        Write-Host "请先安装 Node.js 22.12.0 或更高版本：" -ForegroundColor Yellow
        Write-Host "  官网: https://nodejs.org/" -ForegroundColor White
        Write-Host ""
        exit 1
    }
}

# 检查 npm
function Test-Npm {
    try {
        $npmVersion = npm -v 2>$null
        Write-Host "✓ npm 版本: v$npmVersion" -ForegroundColor Green
        return $true
    }
    catch {
        Write-Host "❌ 未检测到 npm" -ForegroundColor Red
        exit 1
    }
}

# 卸载原版
function Remove-OriginalOpenClaw {
    $installed = npm list -g openclaw 2>$null
    if ($LASTEXITCODE -eq 0) {
        Write-Host "⚠ 检测到原版 OpenClaw，正在卸载..." -ForegroundColor Yellow
        npm uninstall -g openclaw 2>$null
        Write-Host "✓ 原版已卸载" -ForegroundColor Green
    }
}

# 安装汉化版
function Install-ChineseVersion {
    Write-Host ""
    Write-Host "📦 正在安装 OpenClaw 汉化版..." -ForegroundColor Blue
    Write-Host ""
    
    npm install -g @qingchencloud/openclaw-zh@latest
    
    if ($LASTEXITCODE -ne 0) {
        Write-Host "❌ 安装失败，请检查网络连接" -ForegroundColor Red
        exit 1
    }
    
    Write-Host ""
    Write-Host "✓ 安装完成！" -ForegroundColor Green
}

# 成功信息
function Show-Success {
    Write-Host ""
    Write-Host "╔═══════════════════════════════════════════════════════════╗" -ForegroundColor Green
    Write-Host "║                                                           ║" -ForegroundColor Green
    Write-Host "║     ✅ OpenClaw 汉化版安装成功！                          ║" -ForegroundColor Green
    Write-Host "║                                                           ║" -ForegroundColor Green
    Write-Host "╚═══════════════════════════════════════════════════════════╝" -ForegroundColor Green
    Write-Host ""
    Write-Host "🚀 快速开始：" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "   openclaw onboard          # 启动初始化向导（首次必须运行）"
    Write-Host "   openclaw onboard --install-daemon  # 安装后台守护进程"
    Write-Host "   openclaw                  # 启动 OpenClaw"
    Write-Host "   openclaw --help           # 查看帮助"
    Write-Host ""
    Write-Host "💡 OpenClaw 是什么？" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "   开源个人 AI 助手平台，可通过 WhatsApp/Telegram/Discord 等"
    Write-Host "   聊天应用与你的 AI 助手交互，管理邮件、日历、文件等一切事务。"
    Write-Host ""
    Write-Host "📚 更多信息：" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "   汉化官网: https://openclaw.qt.cool/"
    Write-Host "   原版官网: https://openclaw.ai/"
    Write-Host "   GitHub:   https://github.com/1186258278/OpenClawChineseTranslation"
    Write-Host ""
}

# 主流程
function Main {
    Show-Banner
    
    Write-Host "🔍 环境检查..." -ForegroundColor Blue
    Write-Host ""
    
    Test-NodeVersion
    Test-Npm
    
    Write-Host ""
    Remove-OriginalOpenClaw
    Install-ChineseVersion
    Show-Success
}

# 执行
Main
