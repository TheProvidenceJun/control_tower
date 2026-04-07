#!/bin/bash

echo "Starting control_tower environment setup..."

# 1. 기존 bashrc가 있다면 백업
if [ -f ~/.bashrc ]; then
    echo "Backing up existing .bashrc..."
    mv ~/.bashrc ~/.bashrc.backup
fi

# 2. 심볼릭 링크 생성
echo "Creating symlink for .bashrc..."
ln -s ~/Documents/obsidian/control_tower/configs/.bashrc ~/.bashrc

echo "Setup completed successfully!"


== chmod +x setup.sh   ./scripts/setup.sh ==를 실행해줘야 자동화 해줌
