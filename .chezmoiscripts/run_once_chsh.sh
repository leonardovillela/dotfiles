#!/bin/bash

if [ "$(command -v zsh)" ]; then
  echo Zsh is available, but not necessarily the default shell.

  if [ $CODESPACES ]; then
    echo Running on codespaces. Changing shell to zsh.
    sudo chsh "$(id -un)" --shell "/usr/bin/zsh"
  else
    # What shell is the user currently using?
    if [ "$(uname)" = "Darwin" ]; then
      myshell=$(basename "$(dscl . -read "${HOME}" UserShell | sed 's/UserShell: //')")
    else
      myshell=$(basename "$(grep """$(whoami)""" /etc/passwd | cut -f 7 -d :)")
    fi
    if [ "${myshell}" != "zsh" ]; then
      # Set zsh as default shell.
      echo Running sudo to change your shell to zsh.
      sudo chsh -s "$(which zsh)" "$(whoami)"
    fi
  fi
fi
