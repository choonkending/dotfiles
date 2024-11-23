#!/usr/bin/env bash
set -euo pipefail

# Credit to: https://vaneyckt.io/posts/safer_bash_scripts_with_set_euxo_pipefail/
#   set -e option will cause a bash script to exit immediately when a command fails.
#   set -u causes the bash shell to treat unset variables as an error and exit immediately.
#   set -o pipefail sets the exit code of a pipeline to that of the rightmost command to exit with a non-zero status, or to zero if all commands of the pipeline exit successfully.

# Set username, email for every repository on this machine
git config --global user.name "Ken Ding"
git config --global user.email "3787885+choonkending@users.noreply.github.com"

# Set neovim as the core editor for git
git config --global core.editor "nvim"
