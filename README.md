# control_tower  <My Linux Infrastructure & Bio-IT Setup>

[![Ubuntu](https://img.shields.io/badge/Ubuntu-24.04-E95420?logo=ubuntu&logoColor=white)](https://ubuntu.com/)
[![Conda](https://img.shields.io/badge/Conda-Miniforge-44A833?logo=anaconda&logoColor=white)](https://conda.io/)
[![NVM](https://img.shields.io/badge/Node-NVM-339933?logo=node.js&logoColor=white)](https://github.com/nvm-sh/nvm)

This repository tracks my system configurations, package management logs, and optimization strategies for an **Ubuntu 24.04** environment, specifically tailored for **Bioinformatics** and **AI research**.

## Core Philosophy
To maintain a stable and reproducible research environment, I follow these principles:
- **Zero Global Pollution:** Minimize packages installed via `apt` to keep the OS core clean.
- **Isolation First:** Use **Conda** (Miniforge) for Python/Bio-tools and **NVM** for Node.js projects.
- **Documentation:** Every major system change is logged in `/docs` for future reproducibility.

## Tech Stack
- **OS:** Ubuntu 24.04 LTS (Noble Numbat)
- **Environment Managers:** Conda (Miniforge), NVM (Node Version Manager)
- **Primary IDE:** Cursor (AI-powered code editor)
- **Hardware:** Intel i7-11370H / NVIDIA RTX 3050 (Asus Vivobook Pro 14x)

## 📂 Repository Structure
```text
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
1.**Dotfiles Management (Symlink)** `~/.bashrc` is now dynamically tracked via a symbolic link. You do not need to manually copy the file anymore. Whenever you edit `~/.bashrc` in your home directory, simply navigate to this repository and push the changes: 
```
bash 
cd ~/Documents/obsidian/control_tower 
git add configs/.bashrc 
git commit -m "update: modified .bashrc aliases or paths" 
git push
```


2. **Export Conda Environment**
   To save your bioinformatics environment settings:
   ```bash
   conda env export > ./environments/bio_env.yml
   ```

3. **Standalone Software Isolation**
   Check out the log for software installed via local sandboxing (e.g., Portable Wine):
   - [2026-03-21 KakaoTalk Local Install](./docs/install_logs/2026-03-21_KakaoTalk_Local_Install.md)

4. **System Cleanup History**
   Check out my latest system optimization log:
   - [2026-03-19 Cleanup Report](./docs/cleanup/)

## Roadmap
- [x] Apply dotfile symlinking for core configs (e.g., `.bashrc`). 
- [ ] Create an automated bootstrapping script (`setup.sh`) in `/scripts` for one-click setup on a new machine. 
- [ ] Set up Docker containers for legacy bioinformatics tools. 
- [ ] Integrate Obsidian vault sync with this repository.

Maintained by Jun, Biomedical Systems student at Soongsil University.
