#!/bin/bash

DOTFILES_DIR=~/code/rpi-dotfiles
BACKUP_DIR=~/dotfiles_backup

# Create backup directory if it doesn't exist
mkdir -p $BACKUP_DIR

# Change to the dotfiles directory
cd $DOTFILES_DIR

echo "Backing up existing dotfiles and creating symlinks..."

# Loop through all dotfiles
for file in .??*; do
  # Exclude certain files
  if [[ "$file" == ".git" ]] || [[ "$file" == ".gitignore" ]]; then
    continue
  fi

  # Backup existing dotfiles
  if [ -f ~/"$file" ] && [ ! -L ~/"$file" ]; then
    mv ~/"$file" "$BACKUP_DIR/"
    echo "Backed up $file to $BACKUP_DIR/"
  fi

  # Remove existing symlinks
  if [ -L ~/"$file" ]; then
    rm ~/"$file"
  fi

  # Create new symlink
  ln -sv "$DOTFILES_DIR/$file" ~/"$file"
done

echo "Finished backing up dotfiles and creating symlinks."