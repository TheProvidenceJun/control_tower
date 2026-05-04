# <My Linux Infrastructure & Bio-IT Setup>
![Fedora](https://shields.io)
[![Conda|123](https://img.shields.io/badge/Conda-Miniforge-44A833?logo=anaconda&logoColor=white)](https://conda.io/)
[![NVM](https://img.shields.io/badge/Node-NVM-339933?logo=node.js&logoColor=white)](https://github.com/nvm-sh/nvm)

This repository tracks my system configurations, package management logs, and optimization strategies for a **Fedora Linux 44** environment, specifically tailored for **Bioinformatics** and **AI research**.

## Core Philosophy

To maintain a stable and reproducible research environment, I follow these strict principles:

- **Zero Global Pollution:** Minimize native packages installed via `dnf`. All GUI applications must be installed via `Flatpak` to keep the OS core immaculately clean and sandboxed.
    
- **Isolation First:** Use **Conda** (Miniforge) for Python/Bio-tools and **NVM** for Node.js projects.
    
- **Symlink Integrity:** Never allow automated install scripts (like nvm/conda init) to blindly append to `~/.bashrc`, which breaks Git symlinks.
    
- **Documentation:** Every major system change is logged in `/docs` for future reproducibility.
    

## Tech Stack

- **OS:** Fedora Linux 44 (Workstation)
    
- **Environment Managers:** Conda (Miniforge), NVM (Node Version Manager)
    
- **Primary IDE:** Cursor (AI-powered code editor)
    
- **Hardware:** Intel i7-11370H / NVIDIA RTX 3050 (Asus Vivobook Pro 14x)
    

## 📂 Repository Structure

Plaintext

```
.
├── configs/            # Backup of dotfiles (e.g., .bashrc, .condarc)
├── docs/               # System logs and research documentation
│   ├── cleanup/        # Logs of package purges and optimizations
│   └── install_logs/   # Reports for isolated software installations
├── environments/       # Exported Conda environment YAML files
├── scripts/            # Automation shell scripts (.sh)
└── README.md           # Project roadmap and guide
```

## Usage & Maintenance

### 1. Dotfiles Management (Symlink)

`~/.bashrc` is dynamically tracked via a symbolic link. Whenever you edit `~/.bashrc` in your home directory, simply navigate to this repository and push the changes:

Bash

```
cd ~/Documents/obsidian/control_tower 
git add configs/.bashrc 
git commit -m "update: modified .bashrc aliases or paths" 
git push
```

### 2. Fedora Base Setup (Hardware & Media)

Since Fedora strictly adheres to FOSS, proprietary drivers and media codecs must be initialized via RPM Fusion:

Bash

```
# Enable RPM Fusion
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Install NVIDIA Drivers & CUDA (Requires 5 min wait before reboot)
sudo dnf install akmod-nvidia xorg-x11-drv-nvidia-cuda

# Install Media Codecs
sudo dnf group upgrade core
sudo dnf install ffmpeg ffmpeg-libs gstreamer1-plugins-bad-free-extras gstreamer1-plugins-bad-freeworld gstreamer1-plugins-ugly gstreamer1-plugin-openh264 --allowerasing
```

### 3. Safe Environment Installation (Symlink Protection)

To protect the `.bashrc` symlink from being overwritten by auto-installers:

**NVM Installation (Blackhole Routing):**

Bash

```
PROFILE=/dev/null bash -c 'curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash'
```

_(The init script must be manually maintained inside `configs/.bashrc`)_

**Miniforge Installation (Batch Mode):**

Bash

```
curl -L -O https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh
bash Miniforge3-Linux-x86_64.sh -b -p $HOME/miniforge3
```

### 4. Export Conda Environment

To save your bioinformatics environment settings without OS-specific build hashes:

Bash

```
conda env export --no-builds > ./environments/bio_env.yml
```

### 5. Standalone Software Isolation

All non-essential GUI software should be handled via Flatpak.

Check out the log for software installed via local sandboxing:

- [2026-03-21 KakaoTalk Local Install](https://www.google.com/search?q=./docs/install_logs/2026-03-21_KakaoTalk_Local_Install.md)
    

## Roadmap

- [x] Apply dotfile symlinking for core configs (e.g., `.bashrc`).
    
- [ ] Create an automated bootstrapping script (`setup.sh`) in `/scripts` for one-click setup on a new Fedora machine.
    
- [ ] Set up Docker containers for legacy bioinformatics tools.
    
- [ ] Integrate Obsidian vault sync with this repository.
    

Maintained by Jun, Biomedical Systems student at Soongsil University.

