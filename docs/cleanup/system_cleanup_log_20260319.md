# System Optimization & Package Cleanup Report (March 19, 2026)

## Executive Summary
This report documents the system optimization performed on March 19, 2026. The primary goal was to transition the Ubuntu 24.04 environment to a **Conda-first** and **NVM-managed** workflow. By removing global development packages and non-essential desktop components, we have minimized potential dependency conflicts, freed system resources, and ensured a stable, isolated environment for bioinformatics research.

## Categorization Table

| Package(s) | Action | Reasoning |
| :--- | :--- | :--- |
| `nodejs`, `npm` | **Move to Virtual Env** | Transitioned to NVM to manage Node versions without global conflicts. |
| `pipx`, `python3-netifaces` | **Move to Virtual Env** | Bioinformatics tools and Python libraries are now isolated in Conda environments. |
| `libreoffice-*`, `hyphen-*`, `mythes-*` | **Optional (Removed)** | Non-essential desktop office suite components. |
| `thunderbird-locale-*` | **Optional (Removed)** | Localization files for Thunderbird. |
| `proton-vpn-*` | **Optional (Removed)** | Third-party VPN software. |
| `pacman` | **Optional (Removed)** | Non-essential game clone. |
| `alsa-*`, `pipewire-*`, `wireplumber`, `pavucontrol` | **CRITICAL (Kept)** | Core audio stack required for system sound. |
| `linux-*`, `nvidia-*`, `intel-microcode`, `firmware-*` | **CRITICAL (Kept)** | Kernel, hardware drivers, and firmware. |
| `grub-*`, `shim-signed`, `efibootmgr` | **CRITICAL (Kept)** | Bootloader and EFI management. |
| `ubuntu-*`, `snapd`, `init`, `login`, `bsdutils` | **CRITICAL (Kept)** | Core OS meta-packages and system utilities. |
| `language-pack-*`, `ibus-*`, `libhangul*`, `fonts-*` | **CRITICAL (Kept)** | Korean (Hangul) input and CJK rendering support. |
| `git`, `curl`, `vim`, `wget`, `build-essential`, `tree` | **KEEP** | Standard CLI tools for development and maintenance. |
| `google-cloud-cli`, `cursor` | **KEEP** | Primary IDE and cloud management tools. |

## Action Taken
The following command was executed to purge global packages and clean the system:

```bash
sudo apt remove --purge -y \
  nodejs npm pipx python3-netifaces \
  libreoffice-help-common libreoffice-help-en-gb libreoffice-help-en-us libreoffice-help-ko \
  libreoffice-l10n-en-gb libreoffice-l10n-en-za libreoffice-l10n-ko \
  hyphen-en-ca hyphen-en-gb hyphen-en-us \
  mythes-en-au mythes-en-us \
  thunderbird-locale-en thunderbird-locale-en-gb thunderbird-locale-en-us thunderbird-locale-ko \
  proton-vpn-gnome-desktop protonvpn-stable-release \
  pacman && \
sudo apt autoremove -y && \
sudo apt clean
```

**Result:**
- Successfully removed 172 packages and purged over 270 orphaned dependencies.
- Freed approximately **350 MB** of disk space.
- Verified that `node` and `npm` are now exclusively managed by NVM at `~/.nvm/versions/node/v20.20.0/bin/`.

## Next Steps
1. **NVM Management:** Continue using `nvm install` and `nvm use` for Node.js projects to keep the global `/usr/bin/` directory clean.
2. **Conda Environments:** Create dedicated environments for bioinformatics tasks (e.g., `conda create -n bio_env python=3.9`) to isolate specific tool chains.
3. **OS Stability:** Prioritize `apt` only for core system utilities and hardware-specific drivers to maintain long-term OS health.
