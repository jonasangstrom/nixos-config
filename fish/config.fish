if status is-interactive
    starship init fish | source
    zoxide init fish | source
    set -gx EDITOR nvim
end
