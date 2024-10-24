# rpi-dotfiles

Set up a RPi for development, sync those dotfiles... and have some fun!

## Install Some Stuf (tm)

Unlike `upgrade`, `full-upgrade` will handle more complex complexities and will install _or_ remove packages as necessary.

```bash
sudo apt update
sudo apt full-upgrade
sudo apt install git zsh
```

## Change Shell To Zsh

```bash
chsh -s $(which zsh)
```

## Set Up Git & Github

```bash
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

## Hailo-8L Setup

Taken from: [https://github.com/hailo-ai/hailo-rpi5-examples/blob/main/doc/install-raspberry-pi5.md#how-to-set-up-raspberry-pi-5-and-hailo-8l](https://github.com/hailo-ai/hailo-rpi5-examples/blob/main/doc/install-raspberry-pi5.md#how-to-set-up-raspberry-pi-5-and-hailo-8l)

Activate PCIe Gen3...

```bash
sudo raspi-config
sudo reboot
```

Install Hailo packages and run diagnostics. This is a somewhat long install (~900MB)

```bash
sudo apt install hailo-all
hailortcli fw-control identify -y
```
