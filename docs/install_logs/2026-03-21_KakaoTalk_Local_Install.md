# KakaoTalk Local Installation Report (Isolated via Portable Wine)

**Date:** 2026-03-21  
**Target OS:** Ubuntu 24.04 (Noble Numbat)  
**Method:** Portable Wine + Local WINEPREFIX  
**Status:** Successfully Isolated

## Introduction
In accordance with the **"Zero Global Pollution"** philosophy of this repository, the installation of KakaoTalk for Windows was executed without any modifications to the global system environment. By avoiding `sudo apt install wine` and global package managers, the core Ubuntu 24.04 system remains pristine, ensuring that dependency conflicts and "dependency hell" are avoided. This approach prioritizes long-term system stability and reproducibility for critical bioinformatics and research workloads.

## Body: Technical Overview of Isolation Method
The installation utilizes a fully portable and isolated stack:
1.  **Portable Wine Build:** Instead of a system-wide Wine installation, an x86_64 Portable Wine build (v11.5) was downloaded and extracted into a dedicated user-level directory (`~/kakao_env/wine`).
2.  **Isolated WINEPREFIX:** All Windows-related registry entries, file systems, and configuration files are contained within a local directory (`~/kakao_env/.wine_prefix`). This ensures that KakaoTalk's operations cannot affect the host OS or other Wine environments.
3.  **Localization & Font Handling:** To prevent character corruption (UI "tofu"), the environment variable `LANG="ko_KR.UTF-8"` was explicitly set, and NanumGothic fonts were manually injected into the local WINEPREFIX font directory.
4.  **No-Sudo Execution:** Every step of the process—from downloading to running the installer—was performed with user-level permissions, adhering to strict security and maintenance standards.

## Conclusion
The local installation was successful, and KakaoTalk is fully functional within its sandbox. This method proves that complex Windows-based communication tools can be integrated into a Linux-based research workflow without compromising the integrity of the host operating system. The system remains stable, and the application is portable across home directory backups.

## Future Usage Guide

### Launching the Application
You can launch KakaoTalk via the desktop environment's application menu (shortcut: `KakaoTalk`) or manually using the following command:
```bash
env WINEPREFIX="/home/jun/kakao_env/.wine_prefix" LANG="ko_KR.UTF-8" "/home/jun/kakao_env/wine/bin/wine" "/home/jun/kakao_env/.wine_prefix/drive_c/Program Files/Kakao/KakaoTalk/KakaoTalk.exe"
```

### Clean Removal
To remove KakaoTalk and all its associated data without leaving any traces on the host OS, simply delete the isolated environment directory and the desktop entry:
```bash
rm -rf ~/kakao_env
rm ~/.local/share/applications/kakaotalk.desktop
```
