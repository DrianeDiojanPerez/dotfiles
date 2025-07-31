# 🏠 My Dotfiles

> **⚠️ Important:** This dotfiles repository requires [GNU Stow](https://www.gnu.org/software/stow/) to manage symlinks properly.

## 📋 Prerequisites

Before using these dotfiles, you **must** install GNU Stow on your system. Follow the installation instructions for your Linux distribution below.

---

## 🚀 Installing GNU Stow

### 🔵 Arch Linux / Manjaro
```bash
sudo pacman -S stow
```

### 🟠 Ubuntu / Debian / Pop!_OS / Linux Mint
```bash
sudo apt update
sudo apt install stow
```

### 🔴 Red Hat / Fedora / CentOS / Rocky Linux
**Fedora:**
```bash
sudo dnf install stow
```

### 🟣 NixOS
Add to your `configuration.nix`:
```nix
environment.systemPackages = with pkgs; [
  stow
];
```

### 📦 Universal (from source)
If stow isn't available in your package manager:
```bash
# Download and compile from source
wget https://ftp.gnu.org/gnu/stow/stow-latest.tar.gz
tar -xzf stow-latest.tar.gz
cd stow-*
./configure
make
sudo make install
```

---

## 🛠️ Usage

### 1️⃣ Clone the repository
```bash
git clone https://github.com/yourusername/dotfiles.git ~/code/dotfiles
cd ~/code/dotfiles
```

### 2️⃣ Stow your desired configurations
```bash
# Stow individual packages
stow -t ~ vim
stow -t ~ git
stow -t ~ zsh
stow -t ~ alacritty

# Or stow everything at once
stow -t ~ */
```

### 3️⃣ Verify installation
```bash
# Check if symlinks were created correctly
ls -la ~ | grep -E '\->'
```

---

## 📁 Repository Structure

```
dotfiles/
├── alacritty/
│   └── .config/
│       └── alacritty/
│           └── alacritty.toml
├── git/
│   └── .gitconfig
├── nvim/
│   └── .config/
│       └── nvim/
│           ├── init.lua
│           └── lua/
├── tmux/
│   └── .tmux.conf
├── vim/
│   └── .vimrc
└── zsh/
    ├── .zshrc
    └── .zprofile
```

---

## 🔧 Managing Dotfiles

### ➕ Adding new configurations
```bash
# Move existing config to dotfiles
mkdir -p ~/code/dotfiles/newapp/.config/
mv ~/.config/newapp ~/code/dotfiles/newapp/.config/

# Stow the new configuration
cd ~/code/dotfiles
stow -t ~ newapp
```

### ❌ Removing configurations
```bash
# Unstow (removes symlinks)
stow -t ~ -D vim

# This will remove the symlinks but keep the files in dotfiles/
```

### 🔄 Updating configurations
```bash
# Restow (useful after adding new files)
stow -t ~ -R vim
```

### 🔍 Dry run (see what would happen)
```bash
stow -t ~ -n vim
```

---

## 🎯 Why GNU Stow?

- **🔗 Symlink Management**: Creates and manages symbolic links automatically
- **🏠 Clean Home**: Keeps your home directory organized
- **📦 Modular**: Install only the configurations you need
- **🔄 Version Control**: Easy to track changes with git
- **🚀 Portable**: Works across different machines and distros

---

## ⚠️ Important Notes

- **Always backup** your existing configurations before stowing
- Use `stow -n` (dry run) to preview changes before applying
- The `-t ~` flag is required since dotfiles aren't in your home directory
- If you get "existing file" conflicts, move or backup the conflicting files first

---

## 🆘 Troubleshooting

### Conflict errors
```bash
# If you get "existing file" errors, backup and remove conflicts
mv ~/.vimrc ~/.vimrc.backup
stow -t ~ vim
```

### Check stow version
```bash
stow --version
```

### Verify stow installation
```bash
which stow
stow --help
```

---

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

**Happy dotfiling! 🎉**
