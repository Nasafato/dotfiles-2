set -x PATH $HOME/.local/bin /usr/local/bin $PATH /opt/homebrew/bin
set -x EDITOR nvim
set -x VISUAL nvim


alias vim='nvim'
alias cat='bat'
alias ls='eza';
alias cc='cc -std=c17'
alias cm="chezmoi"
alias cme="chezmoi edit"
alias cma="chezmoi -v apply"
alias cmf="chezmoi edit ~/.config/fish/config.fish"
alias cmv="chezmoi edit ~/.config/nvim/init.lua"
alias cmw="chezmoi edit ~/.config/wezterm/wezterm.lua"
alias irypmd="infisical run -- yarn prisma migrate dev"

alias gs="git status"
alias gco="git checkout"
alias grbc="git rebase --continue"
alias grb="git rebase"
alias g="cd ~/dev/goldcard"

#source "$HOME/.config/fish/work/latent.fish"

if status is-interactive
    # Commands to run in interactive sessions can go here
end

function edit_command_buffer --description 'Edit command line in external editor'
    # Creates temporary file and sets to local variable f.
    set -l f (mktemp)
    # Checks if the file was created successfully.
    if set -q f[1]
        # Copies command line buffer to f.
        commandline -b > $f
        # Opens the file using the editor, which will be nvim.
        $EDITOR $f
        # Replaces current command line with contents of f.
        commandline -r (cat $f)
        # Deletes the temporary file.
        rm $f
    else
        echo "error: Failed to create temporary file for editing"
    end
end

function fish_user_key_bindings
    bind \cx\ce edit_command_buffer
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /Users/alangou/miniconda3/bin/conda
    eval /Users/alangou/miniconda3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/Users/alangou/miniconda3/etc/fish/conf.d/conda.fish"
        . "/Users/alangou/miniconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/Users/alangou/miniconda3/bin" $PATH
    end
end
# <<< conda initialize <<<
