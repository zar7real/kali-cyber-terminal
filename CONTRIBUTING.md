```markdown
# 🤝 Contributing to Kali Cyber Terminal

First off, thank you for considering contributing to Kali Cyber Terminal! It's people like you that make this project truly awesome for the cybersecurity community. 🚀

## 📋 Table of Contents

- [🛠️ How Can I Contribute?](#️-how-can-i-contribute)
- [🐛 Reporting Bugs](#-reporting-bugs)
- [💡 Suggesting Enhancements](#-suggesting-enhancements)
- [🔧 Your First Contribution](#-your-first-contribution)
- [📝 Pull Request Process](#-pull-request-process)
- [🎨 Style Guidelines](#-style-guide)
- [📚 Additional Resources](#-additional-resources)

## 🛠️ How Can I Contribute?

### 🐛 Reporting Bugs
This section guides you through submitting a bug report. Following these guidelines helps maintainers understand your report, reproduce the behavior, and find related reports.

### 💡 Suggesting Enhancements
This section guides you through submitting an enhancement suggestion, including completely new features and minor improvements to existing functionality.

### 🔧 Pull Requests
The process described here has several goals:
- Maintain code quality
- Fix problems that are important to users
- Engage the community in working toward the best possible user experience

## 🐛 Reporting Bugs

### 📝 Before Submitting A Bug Report

**Check the following:**
- [ ] You are using the latest version of Kali Linux
- [ ] You are using ZSH as your default shell
- [ ] You have sourced the latest `.zshrc` file
- [ ] You have checked the [existing issues](https://github.com/zar7real/kali-cyber-terminal/issues) for duplicates

### 📊 How Do I Submit A Good Bug Report?

Bugs are tracked as [GitHub issues](https://github.com/zar7real/kali-cyber-terminal/issues). Create an issue and provide the following information:

**Bug Report Template:**
```markdown
## Description
A clear and concise description of what the bug is.

## Steps to Reproduce
1. Open terminal
2. Run command '...'
3. See error

## Expected Behavior
What you expected to happen.

## Actual Behavior
What actually happened.

## Environment
- **Kali Version:** [e.g., Kali Linux 2023.4]
- **ZSH Version:** [e.g., zsh 5.9]
- **Terminal:** [e.g., GNOME Terminal, Konsole, iTerm2]
- **Plugin Info:** [e.g., Oh My Zsh installed: Yes/No]

## Screenshots/Logs
If applicable, add screenshots or terminal logs to help explain your problem.

## Additional Context
Add any other context about the problem here.
```

## 💡 Suggesting Enhancements

### 📝 Before Submitting An Enhancement Suggestion

**Check the following:**
- [ ] You are using the latest version
- [ ] You have checked the [feature requests](https://github.com/zar7real/kali-cyber-terminal/issues?q=is%3Aopen+is%3Aissue+label%3Aenhancement) for similar suggestions
- [ ] The enhancement aligns with the project's goals for Kali Linux users

### 🎯 How Do I Submit A Good Enhancement Suggestion?

Enhancement suggestions are tracked as [GitHub issues](https://github.com/zar7real/kali-cyber-terminal/issues). Create an issue and provide the following information:

**Enhancement Template:**
```markdown
## Problem Statement
A clear and concise description of the problem you're trying to solve.

## Proposed Solution
A clear and concise description of what you want to happen.

## Alternative Solutions
A clear and concise description of any alternative solutions or features you've considered.

## Use Case
Describe a specific scenario where this enhancement would be useful.

## Additional Context
Add any other context or screenshots about the feature request here.
```

## 🔧 Your First Contribution

### 🎯 Good First Issues

Looking for something to start with? Check out our [Good First Issues](https://github.com/zar7real/kali-cyber-terminal/issues?q=is%3Aopen+is%3Aissue+label%3A%22good+first+issue%22)!

### 📚 Setting Up Development Environment

1. **Fork the repository**
   ```bash
   # Click the 'Fork' button on GitHub
   # Then clone your fork locally
   git clone https://github.com/zar7real/kali-cyber-terminal.git
   cd kali-cyber-terminal
   ```

2. **Test your changes**
   ```bash
   # Backup current config
   cp ~/.zshrc ~/.zshrc.backup.test
   
   # Test your changes
   cp .zshrc ~/.zshrc.test
   zsh -c "source ~/.zshrc.test; your-test-command"
   ```

3. **Create a feature branch**
   ```bash
   git checkout -b feature/amazing-feature
   ```

### 🎨 Types of Contributions We're Looking For

#### 🚀 New Aliases
```bash
# Example: Adding a new security tool alias
alias newtool='sudo new-tool --option'
```

#### 🔧 Custom Functions
```zsh
# Example: New scanning function
newscan() {
    echo "[*] Scanning $1..."
    # Your code here
}
```

#### 📖 Documentation
- Improving existing documentation
- Adding usage examples
- Creating tutorials or guides

#### 🐛 Bug Fixes
- Fixing broken aliases
- Resolving compatibility issues
- Improving error handling

#### 🎨 UI/UX Improvements
- Prompt enhancements
- Color scheme improvements
- Better auto-completion

## 📝 Pull Request Process

### 🔄 Workflow

1. **Fork the repository**
2. **Create a feature branch** (`git checkout -b feature/AmazingFeature`)
3. **Commit your changes** (`git commit -m 'Add some AmazingFeature'`)
4. **Push to the branch** (`git push origin feature/AmazingFeature`)
5. **Open a Pull Request**

### ✅ PR Requirements

- [ ] **Test your changes** on a clean Kali Linux installation
- [ ] **Update documentation** if you add new features or change behavior
- [ ] **Follow the style guidelines** below
- [ ] **Add comments** for complex functions
- [ ] **Ensure no sensitive information** is included (API keys, passwords, etc.)

### 📋 PR Template

```markdown
## Description
Please include a summary of the change and which issue is fixed. Please also include relevant motivation and context.

Fixes # (issue)

## Type of Change
Please delete options that are not relevant.
- [ ] Bug fix (non-breaking change which fixes an issue)
- [ ] New feature (non-breaking change which adds functionality)
- [ ] Breaking change (fix or feature that would cause existing functionality to not work as expected)
- [ ] Documentation update

## How Has This Been Tested?
Please describe the tests that you ran to verify your changes. Provide instructions so we can reproduce.

- [ ] Tested on Kali Linux [version]
- [ ] Tested with ZSH version [version]
- [ ] Tested all affected aliases and functions

## Checklist:
- [ ] My code follows the style guidelines of this project
- [ ] I have performed a self-review of my own code
- [ ] I have commented my code, particularly in hard-to-understand areas
- [ ] I have made corresponding changes to the documentation
- [ ] My changes generate no new warnings
- [ ] Any dependent changes have been merged and published in downstream modules

## Screenshots (if appropriate):

## Additional Context
Add any other context about the pull request here.
```

## 🎨 Style Guide

### 📝 ZSH Code Style

#### Aliases
```zsh
# ✅ Good
alias ll='ls -lh --color=auto'
alias nmapquick='sudo nmap -sV -T4'

# ❌ Avoid
alias ll='ls -lh'
alias quicknmap='sudo nmap -sV -T4'  # Inconsistent naming
```

#### Functions
```zsh
# ✅ Good - with proper documentation
#
# quickscan - Fast nmap scan with version detection
# Usage: quickscan <target>
#
quickscan() {
    if [ -z "$1" ]; then
        echo "Usage: quickscan <target>"
        return 1
    fi
    echo "[*] Scanning $1..."
    sudo nmap -sV -sC -T4 "$1"
}
```

#### Variables
```zsh
# ✅ Good
local target="$1"
local scan_results="scan_$(date +%Y%m%d_%H%M%S).txt"

# ❌ Avoid
target=$1
SCAN_RESULTS=scan_$(date +%Y%m%d_%H%M%S).txt
```

### 📚 Documentation Style

- Use **present tense** ("Add feature" not "Added feature")
- Use **imperative mood** ("Move cursor to..." not "Moves cursor to...")
- Reference issues and PRs liberally

### 🔤 Naming Conventions

- **Aliases:** lowercase, descriptive (`nmapfull`, `dirscan`)
- **Functions:** lowercase, verb-noun (`scan_ports`, `backup_files`)
- **Variables:** lowercase, descriptive (`scan_target`, `output_file`)

## 📚 Additional Resources

### 🔗 Useful Links
- [ZSH Documentation](http://zsh.sourceforge.net/Doc/)
- [Kali Linux Documentation](https://www.kali.org/docs/)
- [Oh My Zsh GitHub](https://github.com/ohmyzsh/ohmyzsh)

### 🎓 Learning Resources
- [ZSH Guide for Beginners](https://github.com/rothgar/mastering-zsh)
- [Shell Scripting Best Practices](https://google.github.io/styleguide/shellguide.html)

### 💬 Communication
- **Issues:** [GitHub Issues](https://github.com/zar7real/kali-cyber-terminal/issues)
- **Discussions:** [GitHub Discussions](https://github.com/zar7real/kali-cyber-terminal/discussions)

## 🙏 Thank You!

Your contributions to open source, no matter how small, make a difference. Thank you for being part of the Kali Cyber Terminal community! 🎉

---
