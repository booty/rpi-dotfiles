# rpi-dotfiles

Set up a RPi for development, sync those dotfiles... and have some fun!

## Install and Set Up Git

```bash
sudo apt-get update
sudo apt-get install git
git config --global user.name "booty"
git config --global user.email "your.email@example.com"
ssh-keygen -t ed25519 -C "your.email@example.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub 
```

## Add Key to Github

1. Log in to your GitHub account.
2. Click on your profile picture in the top-right corner and select Settings.
3. In the left sidebar, click SSH and GPG keys.
4. Click the New SSH key button.
5. Title: Enter a descriptive name (e.g., "Raspberry Pi").
6. Key: Paste the SSH public key you copied earlier.
7. Click Add SSH key.

```bash
ssh -T git@github.com # test out access
```