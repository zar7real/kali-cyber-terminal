#!/bin/bash

# 🚀 Kali Cyber Terminal - Installation Script
# Author: zar7real
# GitHub: https://github.com/zar7real/kali-cyber-terminal

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Banner
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
echo -e "${YELLOW}🚀 Kali Cyber Terminal - Installation Script${NC}"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

# Check if ZSH is installed
check_zsh() {
    if ! command -v zsh &> /dev/null; then
        echo -e "${RED}❌ ZSH is not installed!${NC}"
        echo -e "${YELLOW}Installing ZSH...${NC}"
        sudo apt update && sudo apt install -y zsh
        echo -e "${GREEN}✅ ZSH installed successfully!${NC}"
    else
        echo -e "${GREEN}✅ ZSH is already installed ($(zsh --version | head -n1))${NC}"
    fi
}

# Backup existing configuration
backup_config() {
    if [ -f ~/.zshrc ]; then
        local backup_name=".zshrc.backup.$(date +%Y%m%d_%H%M%S)"
        cp ~/.zshrc ~/"${backup_name}"
        echo -e "${YELLOW}📦 Backed up existing .zshrc to ~/${backup_name}${NC}"
    fi
}

# Install main configuration
install_config() {
    echo -e "${YELLOW}⚡ Installing Kali Cyber Terminal configuration...${NC}"
    
    # Copy the main .zshrc file
    if [ -f .zshrc ]; then
        cp .zshrc ~/.zshrc
        echo -e "${GREEN}✅ Main configuration installed${NC}"
    else
        echo -e "${RED}❌ Error: .zshrc file not found in current directory${NC}"
        echo -e "${YELLOW}Please run this script from the kali-cyber-terminal directory${NC}"
        exit 1
    fi
}

# Create necessary directories
create_directories() {
    echo -e "${YELLOW}📁 Creating necessary directories...${NC}"
    mkdir -p ~/.cache/zsh
    mkdir -p ~/bin
    echo -e "${GREEN}✅ Directories created${NC}"
}

# Install recommended plugins
install_plugins() {
    echo -e "${YELLOW}🔌 Checking for recommended plugins...${NC}"
    
    # Check for Oh My Zsh
    if [ ! -d ~/.oh-my-zsh ]; then
        echo -e "${CYAN}💡 Oh My Zsh not found. Would you like to install it? (y/n)${NC}"
        read -r response
        if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
            echo -e "${YELLOW}Installing Oh My Zsh...${NC}"
            sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
            echo -e "${GREEN}✅ Oh My Zsh installed${NC}"
        fi
    else
        echo -e "${GREEN}✅ Oh My Zsh already installed${NC}"
    fi
    
    # Install zsh-syntax-highlighting if Oh My Zsh is present
    if [ -d ~/.oh-my-zsh ]; then
        if [ ! -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]; then
            echo -e "${YELLOW}Installing zsh-syntax-highlighting...${NC}"
            git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
                ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
            echo -e "${GREEN}✅ zsh-syntax-highlighting installed${NC}"
        fi
        
        if [ ! -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]; then
            echo -e "${YELLOW}Installing zsh-autosuggestions...${NC}"
            git clone https://github.com/zsh-users/zsh-autosuggestions \
                ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
            echo -e "${GREEN}✅ zsh-autosuggestions installed${NC}"
        fi
    fi
}

# Change default shell to ZSH
change_shell() {
    current_shell=$(basename "$SHELL")
    if [ "$current_shell" != "zsh" ]; then
        echo -e "${YELLOW}💻 Current shell is $current_shell${NC}"
        echo -e "${CYAN}Would you like to change your default shell to ZSH? (y/n)${NC}"
        read -r response
        if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
            chsh -s $(which zsh)
            echo -e "${GREEN}✅ Default shell changed to ZSH${NC}"
            echo -e "${YELLOW}⚠️  This change will take effect after you log out and back in${NC}"
        fi
    else
        echo -e "${GREEN}✅ ZSH is already your default shell${NC}"
    fi
}

# Final instructions
show_completion() {
    echo ""
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${GREEN}🎉 Kali Cyber Terminal installed successfully!${NC}"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo ""
    echo -e "${YELLOW}🚀 Next steps:${NC}"
    echo -e "  ${CYAN}•${NC} Reload your terminal or run: ${GREEN}source ~/.zshrc${NC}"
    echo -e "  ${CYAN}•${NC} View available commands: ${GREEN}help${NC}"
    echo -e "  ${CYAN}•${NC} Check system info: ${GREEN}sysinfo${NC}"
    echo -e "  ${CYAN}•${NC} Update later with: ${GREEN}./update.sh${NC}"
    echo ""
    echo -e "${YELLOW}📚 Useful commands:${NC}"
    echo -e "  ${GREEN}quickscan target.com${NC}    - Fast network scan"
    echo -e "  ${GREEN}fullscan target.com${NC}     - Complete port scan" 
    echo -e "  ${GREEN}dirscan http://target.com${NC} - Directory enumeration"
    echo -e "  ${GREEN}revshell IP PORT${NC}        - Generate reverse shells"
    echo ""
    echo -e "${CYAN}💡 Need help? Visit: ${NC}https://github.com/zar7real/kali-cyber-terminal"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
}

# Main installation process
main() {
    echo -e "${YELLOW}🔍 Starting installation process...${NC}"
    echo ""
    
    check_zsh
    backup_config
    install_config
    create_directories
    install_plugins
    change_shell
    show_completion
}

# Run main function
main
