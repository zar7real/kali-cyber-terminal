```markdown
# 🚀 Kali Cyber Terminal

> **Ultra-modern ZSH configuration for Kali Linux with cyber-themed prompt, 300+ aliases, and custom penetration testing functions**

![Kali Linux](https://img.shields.io/badge/Kali_Linux-557C94?style=for-the-badge&logo=kalilinux&logoColor=white)
![ZSH](https://img.shields.io/badge/ZSH-1.2.5-1E90FF?style=for-the-badge&logo=gnu-bash&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)
![Aliases](https://img.shields.io/badge/Aliases-300%2B-orange?style=for-the-badge)
![GitHub](https://img.shields.io/badge/GitHub-zar7real-blue?style=for-the-badge)

<div align="center">

**✨ Designed for Security Professionals, Red Team Operators & Cybersecurity Enthusiasts ✨**

*[Add your terminal screenshot here]*

</div>

## 🎯 Table of Contents

- [🌟 Features](#-features)
- [🚀 Quick Start](#-quick-start)
- [🎨 Customization](#-customization)
- [🔧 Aliases & Functions](#-aliases--functions)
- [🛠️ Installation](#️-installation)
- [📦 Dependencies](#-dependencies)
- [🎮 Usage](#-usage)
- [🔍 Examples](#-examples)
- [📚 Documentation](#-documentation)
- [🤝 Contributing](#-contributing)
- [📄 License](#-license)
- [🙏 Acknowledgments](#-acknowledgments)

## 🌟 Features

### 🎨 **Visual & Interface**
| Feature | Description |
|---------|-------------|
| **Cyber Futuristic Prompt** | Multi-line with git status, time, and exit codes |
| **Real-time Syntax Highlighting** | Command coloring with cyber theme |
| **Intelligent Auto-suggestions** | History-based command suggestions |
| **Powerline Symbols** | Professional icons and separators |
| **Git Integration** | Branch status with dirty indicators |

### ⚡ **Performance & Productivity**
| Feature | Description |
|---------|-------------|
| **300+ Aliases** | Shortcuts for every tool and command |
| **50+ Custom Functions** | Penetration testing utilities |
| **Advanced Completion** | Smart tab completion with colors |
| **Enhanced History** | 50,000 command history with sharing |
| **Fast Navigation** | Optimized directory operations |

### 🔧 **Kali-Specific Optimizations**
| Feature | Description |
|---------|-------------|
| **Security Tools Integration** | Pre-configured aliases for 50+ pentesting tools |
| **Network Scanning Wrappers** | Custom nmap and scanning functions |
| **Exploitation Helpers** | Reverse shell generators and payload creators |
| **Encoding Utilities** | Base64, URL, and hash operations |
| **System Monitoring** | Enhanced system info and process management |

## 🚀 Quick Start

### ⚡ **One-Line Installer**
```bash
curl -fsSL https://raw.githubusercontent.com/zar7real/kali-cyber-terminal/main/install.sh | bash
```

### 📥 **Manual Installation**
```bash
# Clone the repository
git clone https://github.com/zar7real/kali-cyber-terminal.git
cd kali-cyber-terminal

# Run the installation script
chmod +x install.sh
./install.sh
```

### 🏃 **Quick Verification**
```bash
# Test if installation worked
reload
help
```

## 🎨 Customization

### 🎯 **Prompt Customization**
Edit these functions in your `~/.zshrc`:

```bash
# Change prompt colors (find these functions in .zshrc)
colored_user() { echo "%F{blue}%B%n%b%f" }        # Username color
colored_host() { echo "%F{green}%B%m%b%f" }       # Hostname color  
colored_path() { echo "%F{yellow}%~%f" }          # Path color
```

### 🌈 **Theme Configuration**
```bash
# Available theme variables in .zshrc
THEME_PRIMARY="green"      # Main theme color
THEME_SECONDARY="cyan"     # Secondary color  
THEME_ACCENT="magenta"     # Accent color
THEME_SUCCESS="green"      # Success indicators
THEME_ERROR="red"          # Error indicators
```

### ⚙️ **Configuration Variables**
```bash
# Edit these in ~/.zshrc for personal preferences
HISTSIZE=50000                    # Command history size
SAVEHIST=50000                    # Saved history entries
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=240'  # Suggestion color
```

## 🔧 Aliases & Functions

### 📋 **Categories Overview**

| Category | Count | Key Examples |
|----------|-------|--------------|
| **Navigation** | 15+ | `..`, `...`, `-`, `md`, `rd` |
| **File Operations** | 25+ | `ls`, `la`, `ll`, `lt`, `tree` |
| **System Monitoring** | 20+ | `sysinfo`, `ports`, `listening`, `htop` |
| **Network Tools** | 40+ | `nmap`, `myip`, `speedtest`, `ping` |
| **Kali Security** | 50+ | `metasploit`, `wireshark`, `sqlmap`, `burp` |
| **Git Shortcuts** | 30+ | `gs`, `ga`, `gc`, `gp`, `gco` |
| **Docker** | 15+ | `dps`, `dimg`, `dlogs`, `dex` |
| **Python** | 10+ | `py`, `pip`, `venv`, `activate` |
| **Utilities** | 45+ | `extract`, `compress`, `hashfile`, `genpass` |

### 🛠️ **Featured Custom Functions**

#### 🔍 **Scanning & Reconnaissance**
```bash
quickscan target.com          # Fast nmap with version detection
fullscan 192.168.1.1          # Complete all-port scan  
vulnscan target.com           # Vulnerability assessment
portscan 10.0.0.1             # Common ports scan
subdomains example.com        # Subdomain enumeration
```

#### 🌐 **Web Application Testing**
```bash
dirscan http://target.com     # Directory bruteforce
serve 8080                    # Start HTTP server
dnslookup domain.com          # Complete DNS records
whoislookup target.com        # WHOIS information
```

#### 💥 **Exploitation & Post-Exploitation**
```bash
revshell 192.168.1.100 4444   # Generate reverse shell payloads
msflistener 4444              # Start Metasploit handler
crackzip file.zip wordlist.txt # Crack password-protected ZIP
pattern_create 100            # Generate overflow pattern
pattern_offset "Aa0A"         # Calculate pattern offset
```

#### 🔧 **System & Utilities**
```bash
extract archive.zip           # Universal archive extraction
compress backup.tar.gz folder # Smart compression
mkcd new_project              # Create and enter directory
hashfile document.pdf         # Multiple hash calculation
sysinfo                       # Comprehensive system information
```

## 🛠️ Installation

### 📋 **Prerequisites**
```bash
# Essential packages (most are pre-installed in Kali)
sudo apt update
sudo apt install zsh git curl wget

# Optional but recommended
sudo apt install tree htop net-tools dnsutils
```

### 🔄 **Step-by-Step Setup**

#### 1. **Install ZSH** (if not already installed)
```bash
sudo apt install zsh
chsh -s $(which zsh)
```

#### 2. **Clone & Install**
```bash
git clone https://github.com/zar7real/kali-cyber-terminal.git
cd kali-cyber-terminal
./install.sh
```

#### 3. **Manual Installation (Alternative)**
```bash
# Backup existing configuration
cp ~/.zshrc ~/.zshrc.backup.$(date +%Y%m%d_%H%M%S)

# Install new configuration
cp .zshrc ~/.zshrc

# Create necessary directories
mkdir -p ~/.cache/zsh
mkdir -p ~/bin

# Reload configuration
source ~/.zshrc
```

#### 4. **Install Plugins** (Recommended)
```bash
# Install Oh My Zsh framework
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Install auto-suggestions  
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

### 🔧 **Update Installation**
```bash
# Navigate to installation directory
cd kali-cyber-terminal

# Pull latest changes and update
./update.sh

# Or manually:
git pull origin main
cp .zshrc ~/.zshrc
source ~/.zshrc
```

## 📦 Dependencies

### 📋 **Core Dependencies**
| Package | Purpose | Installation |
|---------|---------|--------------|
| **ZSH** | Shell environment | `sudo apt install zsh` |
| **Git** | Version control | `sudo apt install git` |
| **cURL** | Network requests | `sudo apt install curl` |

### 🎨 **Recommended Plugins**
| Plugin | Purpose | Installation |
|--------|---------|--------------|
| **zsh-syntax-highlighting** | Command syntax coloring | [Install Guide](https://github.com/zsh-users/zsh-syntax-highlighting) |
| **zsh-autosuggestions** | History-based suggestions | [Install Guide](https://github.com/zsh-users/zsh-autosuggestions) |
| **Oh My Zsh** | Framework & plugins | `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"` |

### 🔧 **Optional Tools**
| Tool | Purpose | Kali Package |
|------|---------|--------------|
| **Tree** | Directory listing | `sudo apt install tree` |
| **Htop** | Process monitoring | `sudo apt install htop` |
| **Net-tools** | Network utilities | `sudo apt install net-tools` |
| **DNSutils** | DNS troubleshooting | `sudo apt install dnsutils` |

## 🎮 Usage

### 🆘 **Getting Help**
```bash
help        # Show main custom commands
help_full   # Show all aliases and functions
alias       # List all configured aliases
```

### 🔍 **Common Workflows**

#### 🎯 **Penetration Testing Workflow**
```bash
# 1. Reconnaissance & Information Gathering
quickscan target.com
subdomains target.com
whoislookup target.com
dnslookup target.com

# 2. Scanning & Enumeration  
fullscan target.com
vulnscan target.com
dirscan http://target.com
dirscan https://target.com

# 3. Exploitation
revshell YOUR_IP 4444
# In separate terminal: msflistener 4444

# 4. Post-Exploitation
sysinfo
hashfile sensitive_document.pdf
```

#### 💻 **Development Workflow**
```bash
# Project initialization
mkcd new_security_tool
git init
venv
activate

# Development cycle
gs        # git status
ga .      # git add all
gc "feat: add new feature"  # git commit
gp        # git push
```

#### 🛠️ **System Administration**
```bash
# System monitoring
sysinfo
ports
listening
htop

# Maintenance operations  
update
clean
bigfiles 10
netmon
```

### ⌨️ **Keyboard Shortcuts**

| Shortcut | Action | Description |
|----------|--------|-------------|
| `Ctrl + A` | Beginning of line | Move cursor to start |
| `Ctrl + E` | End of line | Move cursor to end |
| `Ctrl + R` | Search history | Interactive history search |
| `Ctrl + W` | Delete word | Remove previous word |
| `Ctrl + U` | Clear line | Delete to beginning |
| `Ctrl + K` | Clear line | Delete to end |
| `Tab` | Auto-complete | Intelligent completion |
| `↑↓` | History navigation | Browse command history |

## 🔍 Examples

### 🎯 **Real-World Usage Examples**

#### 1. **Complete Penetration Test**
```bash
# Target assessment: example.com

# Phase 1: Passive Reconnaissance
whoislookup example.com
dnslookup example.com
subdomains example.com

# Phase 2: Active Scanning
quickscan example.com
fullscan example.com
vulnscan example.com

# Phase 3: Web Application Testing
dirscan http://example.com
dirscan https://example.com

# Phase 4: Exploitation Preparation
revshell 10.0.0.5 4444
# Start handler: msflistener 4444
```

#### 2. **Daily System Operations**
```bash
# Quick system health check
sysinfo
ports
listening

# Maintenance tasks
update          # Update system packages
clean           # Clean package cache
bigfiles 15     # Find 15 largest files

# Network monitoring
netmon          # Real-time traffic monitoring
speedtest       # Internet speed test
```

#### 3. **File & Archive Management**
```bash
# Archive operations
compress project_backup.tar.gz /important/data
extract downloaded_tool.zip
hashfile document.pdf

# File search and organization
ff "*.conf"     # Find configuration files
fd "logs"       # Find log directories
tree -L 3       # Display directory structure
```

### 🎨 **Prompt Display Examples**

**Standard User:**
```bash
╭─[john@kali]─[~/projects/security-tool]─[main ✓⚡]
╰─● $
```

**Root User:**
```bash
╭─[root@kali]─[/etc/nginx/sites-available]─[main ✘ 1]
╰─● #
```

**With Background Jobs:**
```bash
╭─[user@kali]─[~/scans]─[detached HEAD ●]
╰─● $ ⚙ 2 [14:32:15]
```

## 📚 Documentation

### 📖 **Function Documentation**

#### 🔍 **Scanning Functions**

**`quickscan <target>`**
- **Description:** Fast network reconnaissance with service detection
- **Output:** `scan_target_YYYYMMDD_HHMMSS.txt`
- **Options:** `-sV -sC -T4`
- **Usage:** `quickscan 192.168.1.1`

**`fullscan <target>`**
- **Description:** Comprehensive port and service enumeration
- **Scans:** All 65535 ports with OS detection
- **Options:** `-sS -sV -O -A -p- -T4`
- **Usage:** `fullscan target.com`

**`vulnscan <target>`**
- **Description:** Vulnerability assessment using NSE scripts
- **Scripts:** Uses `--script vuln` category
- **Output:** Identifies common vulnerabilities
- **Usage:** `vulnscan 10.0.0.1`

#### 🌐 **Web Testing Functions**

**`dirscan <url>`**
- **Description:** Directory and file bruteforce
- **Wordlist:** `directory-list-2.3-medium.txt`
- **Output:** Timestamped results file
- **Usage:** `dirscan http://target.com`

**`serve [port]`**
- **Description:** Quick HTTP file server
- **Default:** Port 8000
- **Purpose:** File sharing during tests
- **Usage:** `serve 8080`

#### 💥 **Exploitation Functions**

**`revshell <lhost> <lport>`**
- **Description:** Multi-language reverse shell generator
- **Languages:** bash, python, netcat, php
- **Includes:** Listener command reference
- **Usage:** `revshell 192.168.1.100 4444`

**`msflistener [port]`**
- **Description:** Metasploit handler quick-start
- **Default:** Port 4444
- **Payload:** linux/x86/meterpreter/reverse_tcp
- **Usage:** `msflistener 4444`

### 🔧 **Troubleshooting Guide**

#### ❌ **Common Issues & Solutions**

**Problem:** Syntax highlighting not working
```bash
# Solution: Install zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# Add to plugins in ~/.zshrc: zsh-syntax-highlighting
```

**Problem:** Auto-suggestions not visible
```bash
# Solution: Install zsh-autosuggestions  
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# Add to plugins in ~/.zshrc: zsh-autosuggestions
```

**Problem:** Prompt icons display incorrectly
```bash
# Solution: Install powerline fonts
sudo apt install fonts-powerline
# Configure terminal to use a powerline font
```

**Problem:** Custom commands not found
```bash
# Solution: Reload configuration
source ~/.zshrc

# Verify installation
which nmap
which git
which curl
```

## 🤝 Contributing

We welcome contributions from the security community! Please read our [Contributing Guidelines](CONTRIBUTING.md) for details.

### 🐛 **Reporting Bugs**
1. Check [existing issues](https://github.com/zar7real/kali-cyber-terminal/issues)
2. Use the bug report template
3. Include system details and error messages

### 💡 **Suggesting Features**  
1. Review [current feature requests](https://github.com/zar7real/kali-cyber-terminal/issues)
2. Explain use case and benefits
3. Provide practical examples

### 🔧 **Development Process**
```bash
# 1. Fork the repository
# 2. Create feature branch
git checkout -b feature/amazing-feature

# 3. Commit changes
git commit -m "feat: add amazing feature"

# 4. Push to branch  
git push origin feature/amazing-feature

# 5. Open Pull Request
```

### 📋 **Contribution Guidelines**
- Follow existing code style and conventions
- Add comments for complex functions
- Update relevant documentation
- Test on Kali Linux before submitting

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for full details.

## 🙏 Acknowledgments

- **Kali Linux Team** - For the amazing penetration testing distribution
- **ZSH Community** - For the incredible shell and plugin ecosystem
- **Oh My Zsh Contributors** - For inspiration and configuration patterns
- **Security Community** - For continuous feedback and improvement

---

<div align="center">

**⭐ If you find this project helpful, please give it a star! ⭐**

**🐛 Found a bug? [Open an issue](https://github.com/zar7real/kali-cyber-terminal/issues)**

**💡 Have an idea? [Suggest a feature](https://github.com/zar7real/kali-cyber-terminal/issues)**

**🔧 Want to help? [Read contributing guidelines](CONTRIBUTING.md)**

---

**Made with ❤️ for the Cybersecurity Community**

</div>
```
