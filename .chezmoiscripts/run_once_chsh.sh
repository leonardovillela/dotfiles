#!/bin/bash

set -euo pipefail

if [ "$(command -v zsh)" ]; then
  echo "Zsh is available, but not necessarily the default shell."

  # What shell is the user currently using?
  if [ "$(uname)" = "Darwin" ]; then
    myshell=$(basename "$(dscl . -read "${HOME}" UserShell 2>/dev/null | sed 's/UserShell: //' || echo "${SHELL}")")
  else
    myshell=$(basename "$(getent passwd "$(whoami)" 2>/dev/null | cut -f 7 -d : || echo "${SHELL}")")
  fi
  
  if [ "${myshell}" != "zsh" ]; then
    # Set zsh as default shell.
    echo "Running sudo to change your shell to zsh."
    if command -v sudo >/dev/null 2>&1; then
      sudo chsh -s "$(which zsh)" "$(whoami)"
    else
      echo "Warning: sudo not available, cannot change shell automatically"
      echo "Please run manually: chsh -s $(which zsh)"
    fi
  else
    echo "Zsh is already the default shell."
  fi
else
  echo "Zsh is not installed, skipping shell change."
fi
