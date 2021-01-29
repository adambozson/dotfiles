if test (arch) = "arm64"
    eval (/opt/homebrew/bin/brew shellenv)
else
    set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
end

