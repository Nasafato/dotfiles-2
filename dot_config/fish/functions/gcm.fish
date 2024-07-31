function gcm
    if test (count $argv) -eq 0
        echo "Usage: gcm <commit message>"
        return 1
    end

    set -l commit_message "$argv"
    echo "Commit message: $commit_message"
    git commit -m "$commit_message"
end
