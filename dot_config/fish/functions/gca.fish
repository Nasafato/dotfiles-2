function gca
    set -l commit_message "$argv"
    echo "Commit message: $commit_message"
    git commit --amend --no-edit
end
