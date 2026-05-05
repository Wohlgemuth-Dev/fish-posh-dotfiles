<div align="center">

# 🚀 Ultimate Linux Terminal Setup

<img src="https://img.shields.io/badge/Shell-Fish-1f425f?style=for-the-badge&logo=gnu-bash&logoColor=white" />
<img src="https://img.shields.io/badge/Prompt-Oh_My_Posh-007ACC?style=for-the-badge&logo=powershell&logoColor=white" />
<img src="https://img.shields.io/badge/OS-Linux_%7C_WSL-FCC624?style=for-the-badge&logo=linux&logoColor=black" />

A stunning, fully automated terminal configuration for native Linux and Windows Subsystem for Linux (WSL).

---
</div>

## ✨ Features

- **Automated Install**: Just one script `install.sh` that does all the heavy lifting.
- **Smart Environment Detection**: Custom logic for Native Linux vs WSL.
- **Automatic Fonts**: Downloads and installs `FiraCode Nerd Font` automatically (on Native Linux).
- **Beautiful Prompt**: Powered by Oh My Posh and a custom theme.

## 📥 Installation

Simply clone this repository and run the install script:

```bash
git clone https://github.com/Wohlgemuth-Dev/fish-posh-dotfiles.git
cd fish-posh-dotfiles
./install.sh
```

### Note for WSL Users:
Since WSL uses the Windows Terminal for rendering, the install script will prompt you to manually set your font in the Windows Terminal settings. Download the [FiraCode Nerd Font](https://www.nerdfonts.com/font-downloads) and install it on Windows to render the prompt correctly.

## 🗂️ File Structure

- `install.sh`: The automated magic setup script.
- `config.fish`: The fish shell configuration file.
- `customMontys.omp.json`: The Oh My Posh theme configuration.

## 🎨 Terminal Colors (GNOME Terminal)

If you are using GNOME Terminal on native Linux, we highly recommend the **Everforest Dark Hard** theme from Gogh.
```bash
bash -c "$(wget -qO- https://git.io/vQgMr)"
```
*(Select theme number 69)*
