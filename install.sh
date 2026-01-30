#!/bin/bash
# ============================================================
# OpenClaw 汉化发行版 - 一键安装脚本
# 
# OpenClaw: 开源个人 AI 助手平台
# 官方网站: https://openclaw.ai/
# 汉化项目: https://openclaw.qt.cool/
#
# 武汉晴辰天下网络科技有限公司 | https://qingchencloud.com/
# ============================================================

set -e

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Logo
print_banner() {
    echo -e "${CYAN}"
    echo "╔═══════════════════════════════════════════════════════════╗"
    echo "║                                                           ║"
    echo "║     🦞 OpenClaw 汉化发行版                                ║"
    echo "║        开源个人 AI 助手平台                              ║"
    echo "║                                                           ║"
    echo "║     武汉晴辰天下网络科技有限公司                          ║"
    echo "║     https://openclaw.qt.cool/                             ║"
    echo "║                                                           ║"
    echo "╚═══════════════════════════════════════════════════════════╝"
    echo -e "${NC}"
}

# 检查命令是否存在
check_command() {
    if ! command -v "$1" &> /dev/null; then
        return 1
    fi
    return 0
}

# 检查 Node.js 版本
check_node_version() {
    if ! check_command node; then
        echo -e "${RED}❌ 未检测到 Node.js${NC}"
        echo ""
        echo -e "${YELLOW}请先安装 Node.js 22.12.0 或更高版本：${NC}"
        echo "  官网: https://nodejs.org/"
        echo "  推荐: 使用 nvm 管理 Node.js 版本"
        echo ""
        exit 1
    fi

    NODE_VERSION=$(node -v | sed 's/v//')
    NODE_MAJOR=$(echo "$NODE_VERSION" | cut -d. -f1)

    if [ "$NODE_MAJOR" -lt 22 ]; then
        echo -e "${RED}❌ Node.js 版本过低: v$NODE_VERSION${NC}"
        echo ""
        echo -e "${YELLOW}OpenClaw 需要 Node.js >= 22.12.0${NC}"
        echo "请升级 Node.js 后重试"
        echo ""
        exit 1
    fi

    echo -e "${GREEN}✓${NC} Node.js 版本: v$NODE_VERSION"
}

# 检查 npm
check_npm() {
    if ! check_command npm; then
        echo -e "${RED}❌ 未检测到 npm${NC}"
        exit 1
    fi
    NPM_VERSION=$(npm -v)
    echo -e "${GREEN}✓${NC} npm 版本: v$NPM_VERSION"
}

# 卸载原版（如果存在）
uninstall_original() {
    if npm list -g openclaw &> /dev/null; then
        echo -e "${YELLOW}⚠${NC} 检测到原版 OpenClaw，正在卸载..."
        npm uninstall -g openclaw 2>/dev/null || true
        echo -e "${GREEN}✓${NC} 原版已卸载"
    fi
}

# 安装汉化版
install_chinese() {
    echo ""
    echo -e "${BLUE}📦 正在安装 OpenClaw 汉化版...${NC}"
    echo ""
    
    npm install -g @qingchencloud/openclaw-zh@latest
    
    echo ""
    echo -e "${GREEN}✓${NC} 安装完成！"
}

# 打印成功信息
print_success() {
    echo ""
    echo -e "${GREEN}╔═══════════════════════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}║                                                           ║${NC}"
    echo -e "${GREEN}║     ✅ OpenClaw 汉化版安装成功！                          ║${NC}"
    echo -e "${GREEN}║                                                           ║${NC}"
    echo -e "${GREEN}╚═══════════════════════════════════════════════════════════╝${NC}"
    echo ""
    echo -e "${CYAN}🚀 快速开始：${NC}"
    echo ""
    echo "   openclaw onboard          # 启动初始化向导（首次必须运行）"
    echo "   openclaw onboard --install-daemon  # 安装后台守护进程"
    echo "   openclaw                  # 启动 OpenClaw"
    echo "   openclaw --help           # 查看帮助"
    echo ""
    echo -e "${CYAN}💡 OpenClaw 是什么？${NC}"
    echo ""
    echo "   开源个人 AI 助手平台，可通过 WhatsApp/Telegram/Discord 等"
    echo "   聊天应用与你的 AI 助手交互，管理邮件、日历、文件等一切事务。"
    echo ""
    echo -e "${CYAN}📚 更多信息：${NC}"
    echo ""
    echo "   汉化官网: https://openclaw.qt.cool/"
    echo "   原版官网: https://openclaw.ai/"
    echo "   GitHub:   https://github.com/1186258278/OpenClawChineseTranslation"
    echo ""
}

# 主流程
main() {
    print_banner
    
    echo -e "${BLUE}🔍 环境检查...${NC}"
    echo ""
    
    check_node_version
    check_npm
    
    echo ""
    uninstall_original
    install_chinese
    print_success
}

main "$@"
