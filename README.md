# The real steps
1. To git clone anything on Mac, need to first install `xcode-select --install`
2. Then, you need to get a new Git `ssh` key
3. Install brew: `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
4. Then, to set up the local dev environment, need to get the whole set of config files, which is managed by `chezmoi`

# Dotfiles

To install, run `chezmoi init --ssh git@github.com:Nasafato/dotfiles-2.git`. Then, `chezmoi cd` and run `chezmoi apply`.
