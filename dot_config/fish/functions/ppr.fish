function ppr
    gh pr ready
    set pr_url (gh pr view --json url --jq '.url')
    echo $pr_url
    echo $pr_url | pbcopy
end

