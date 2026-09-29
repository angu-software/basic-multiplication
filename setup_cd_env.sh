#!/bin/zsh
set -e
#set -x

echo "[ -- Install mise -- ]"
if ! command -v mise >/dev/null 2>&1; then
    curl https://mise.run/zsh | sh
    source "$HOME/.zshrc"
else
    echo "mise already installed"
fi
mise settings ruby.compile=false
# ruby requires xcode to build open ssl!

echo "[ -- Configure workspace -- ]"
mise trust mise.toml
mise install

gem install bundler -v "$LOCAL_BUNDLER_VERSION"
bundle install
