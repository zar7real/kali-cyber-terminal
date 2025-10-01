#!/bin/bash

# 🔄 Kali Cyber Terminal - Update Script
# Author: zar7real
# GitHub: https://github.com/zar7real/kali-cyber-terminal

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

echo -e "${CYAN}"
cat << "EOF"
    ██╗  ██╗ █████╗ ██╗     ██╗    ██╗   ██╗██╗  ██╗████████╗██████╗  █████╗ 
    ██║ ██╔╝██╔══██╗██║     ██║    ██║   ██║██║  ██║╚══██╔══╝██╔══██╗██╔══██╗
    █████╔╝ ███████║██║     ██║    ██║   ██║██║  ██║   ██║   ██████╔╝███████║
    ██╔═██╗ ██╔══██║██║     ██║    ██║   ██║██║  ██║   ██║   ██╔══██╗██╔══██║
    ██║  ██╗██║  ██║███████╗██║    ╚██████╔╝███████╔╝   ██║   ██║  ██║██║  ██║
    ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═╝     ╚═════╝ ╚══════╝    ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝
EOF
echo -e "${NC}"
echo -e "${YELLOW}🔄 Kali Cyber Terminal - Update Script${NC}"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

# Check if we're in the right directory
check_directory() {
    if [ ! -f .zshrc ] || [ ! -f install.sh ]; then
        echo -e "${RED}❌ Error: Please run this script from the kali-cyber-terminal directory${NC}"
        echo -e "${YELLOW}Navigate to the directory where you cloned the repository${NC}"
        exit 1
    fi
}

# Backup current configuration
backup_current() {
    if [ -f ~/.zshrc ]; then
        local backup_name=".zshrc.backup.pre-update.$(date +%Y%m%d_%H%M%S)"
        cp ~/.zshrc ~/"${backup_name}"
        echo -e "${YELLOW}📦 Backed up current .zshrc to ~/${backup_name}${NC}"
    fi
}

# Pull latest changes from GitHub
pull_updates() {
    echo -e "${YELLOW}📥 Pulling latest updates from GitHub...${NC}"
    
    # Check if this is a git repository
    if [ -d .git ]; then
        git fetch origin
        local behind_count=$(git rev-list HEAD..origin/main --count 2>/dev/null || echo "unknown")
        
        if [ "$behind_count" != "0" ] && [ "$behind_count" != "unknown" ]; then
            echo -e "${CYAN}🔄 $behind_count new commits available${NC}"
            git pull origin main
            echo -e "${GREEN}✅ Repository updated successfully${NC}"
        else
            echo -e "${GREEN}✅ Already up to date${NC}"
        fi
    else
        echo -e "${YELLOW}⚠️  Not a git repository, skipping git pull${NC}"
    fi
}

# Install updated configuration
install_updated() {
    echo -e "${YELLOW}⚡ Installing updated configuration...${NC}"
    
    if [ -f .zshrc ]; then
        cp .zshrc ~/.zshrc
        echo -e "${GREEN}✅ Configuration updated${NC}"
    else
        echo -e "${RED}❌ Error: .zshrc file not found${NC}"
        exit 1
    fi
}

# Update plugins
update_plugins() {
    echo -e "${YELLOW}🔌 Updating plugins...${NC}"
    
    # Update zsh-syntax-highlighting
    if [ -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]; then
        echo -e "${CYAN}Updating zsh-syntax-highlighting...${NC}"
        cd ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
        git pull
        cd - > /dev/null
        echo -e "${GREEN}✅ zsh-syntax-highlighting updated${NC}"
    fi
    
    # Update zsh-autosuggestions
    if [ -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]; then
        echo -e "${CYAN}Updating zsh-autosuggestions...${NC}"
        cd ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
        git pull
        cd - > /dev/null
        echo -e "${GREEN}✅ zsh-autosuggestions updated${NC}"
    fi
    
    # Return to original directory
    cd "$(dirname "$0")"
}

# Reload configuration
reload_config() {
    echo -e "${YELLOW}🔄 Reloading ZSH configuration...${NC}"
    
    if [ -n "$ZSH_VERSION" ]; then
        # We're in ZSH, reload directly
        source ~/.zshrc
        echo -e "${GREEN}✅ Configuration reloaded${NC}"
    else
        echo -e "${YELLOW}⚠️  Please restart your terminal or run: ${GREEN}source ~/.zshrc${NC}"
    fi
}

# Show update summary
show_summary() {
    echo ""
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${GREEN}🎉 Kali Cyber Terminal updated successfully!${NC}"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo ""
    echo -e "${YELLOW}📋 Update Summary:${NC}"
    echo -e "  ${GREEN}✅${NC} Configuration files updated"
    echo -e "  ${GREEN}✅${NC} Plugins checked and updated"
    echo -e "  ${GREEN}✅${NC} Backup created"
    echo ""
    echo -e "${YELLOW}🚀 What's new?${NC}"
    echo -e "  ${CYAN}•${NC} Check the ${GREEN}CHANGELOG.md${NC} (if available)"
    echo -e "  ${CYAN}•${NC} View latest commits on ${CYAN}GitHub${NC}"
    echo ""
    echo -e "${YELLOW}💡 Pro tip:${NC}"
    echo -e "  Run ${GREEN}help${NC} to see all available commands"
    echo ""
    echo -e "${CYAN}🔗 GitHub: ${NC}https://github.com/zar7real/kali-cyber-terminal"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
}

# Main update process
main() {
    echo -e "${YELLOW}🔍 Starting update process...${NC}"
    echo ""
    
    check_directory
    backup_current
    pull_updates
    install_updated
    update_plugins
    reload_config
    show_summary
}

# Run main function
main
