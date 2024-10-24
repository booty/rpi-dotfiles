# rpi-dotfiles

Set up a RPi for development, sync those dotfiles... and have some fun!

## Install Some Stuf (tm)

Unlike `upgrade`, `full-upgrade` will handle more complex complexities and will install _or_ remove packages as necessary.

- `zoxide` a replacement for `z` for fast directory jumping
- `fzf` fuzzy finder
- `lsd` a sick ass replacement for ls
- `htop` a sick replacement for top, use this if you're not wack
- `bat` cat replacement with syntax highlighting
- `ripgrep` fast ass searching
- `silversearcher-ag` not quite as fast but fast and I'm used to it

```bash
sudo apt update
sudo apt full-upgrade
sudo apt install -y git zsh zoxide fzf lsd htop wget curl bat ripgrep silversearcher-ag
```

Okay! You're doing great. Now install some more dev stuff, maybe, and set the default browser to Firefox.

```bash
sudo apt install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev
sudo update-alternatives --config x-www-browser
```

## Change Shell To Zsh

```bash
chsh -s $(which zsh)

git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.zsh/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
```

You'll need to source them in `~/.zshrc` with:

```bash
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
```

...annnnnd log out and back in again, so the shell change can take effect.

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

## Get This Repo, I Guess

```bash
mkdir -p ~/code
cd ~/code
git clone git@github.com:booty/rpi-dotfiles.git
./setup.sh
```

## Hailo-8L Setup

Taken from: [https://github.com/hailo-ai/hailo-rpi5-examples/blob/main/doc/install-raspberry-pi5.md#how-to-set-up-raspberry-pi-5-and-hailo-8l](https://github.com/hailo-ai/hailo-rpi5-examples/blob/main/doc/install-raspberry-pi5.md#how-to-set-up-raspberry-pi-5-and-hailo-8l)

Activate PCIe Gen3. It's under "Advanced."

Install Hailo packages and run diagnostics. This is a somewhat long install. (~900MB)

```bash
sudo raspi-config
sudo apt install -y hailo-all
sudo reboot
```

Make sure things are working.

```bash
hailortcli fw-control identify
```

Then, cool. Download some code.

```bash
cd ~/Documents/code
git clone git@github.com:hailo-ai/hailo-rpi5-examples.git
```
