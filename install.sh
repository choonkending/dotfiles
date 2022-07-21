#!/usr/bin/env bash
set -euo pipefail

echo -e "👋 Welcome to choonkending/dotfiles 👋\n"

function setup_macos() {
    if [[ "$(uname)" == "Darwin" ]]; then

        echo -e "🚧 Installing brew dependencies with homebrew on your MacOS machine 🚧 \n"

	brew bundle

	echo -e "🎉 Successfully installed your dependencies 🎉\n"


	echo -e "\n...\n"

	echo -e "📗 Copying over neovim configurations over to your local filesystem 📗\n"

	mkdir -p ~/.config/nvim/
        cp -r nvim/ ~/.config/nvim/

	echo -e "🎉 Successfully copied over your neovim settings\n"

	echo -e "\n🥇 We are done! 🥇\n"

    else
        warning "macOS is not detected. Skipping."
    fi
}

setup_macos

