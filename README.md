# control_tower  <My Linux Infrastructure & Bio-IT Setup>

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
├── configs/           # Backup of dotfiles (e.g., .bashrc, .condarc)
├── docs/              # System logs and research documentation
│   └── cleanup/       # Logs of package purges and optimizations
├── environments/      # Exported Conda environment YAML files
├── scripts/           # Automation shell scripts (.sh)
└── README.md          # Project roadmap and guide
```
## Usage & Maintenance
1. How to Backup your current .bashrc

Whenever you update your aliases or paths, run:
Bash

    cp ~/.bashrc ./configs/ && git add . && git commit -m "update: sync .bashrc" && git push

2. How to Export Conda Environment

To save your bioinformatics environment settings:
Bash

 
    conda env export > ./environments/bio_env.yml


3. System Cleanup History

Check out my latest system optimization log:

    2026-03-19 Cleanup Report

 ## Roadmap

    [ ] Automate dotfile symlinking via a setup script in /scripts.

    [ ] Set up Docker containers for legacy bioinformatics tools.

    [ ] Integrate Obsidian vault sync with this repository.

Maintained by Jun, Biomedical Systems student at Soongsil University.
